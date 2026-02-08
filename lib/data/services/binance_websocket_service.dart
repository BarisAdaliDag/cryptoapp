import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';
import 'package:cryptoapp/data/services/i_binance_websocket_service.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketService implements IBinanceWebSocketService {
  final String wsUrl = 'wss://stream.binance.com:9443/ws';

  // ================== CONNECTION STATE ==================
  WebSocketChannel? _channel;

  @override
  bool get isConnected => _channel != null && _channel!.closeCode == null;

  int _reconnectAttempts = 0;

  // ================== STREAM CONTROLLERS ==================
  StreamController<List<MiniTickerModel>>? _allMarketsController;
  final Map<String, StreamController<SymbolTickerModel>> _symbolControllers = {};

  // ================== REQUEST TRACKING ==================
  final Map<int, Completer<bool>> _pendingRequests = {};
  final Set<String> _activeStreams = {};

  // ================== CONNECT ==================
  @override
  void connect() {
    if (_channel != null) return;

    _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    _channel!.stream.listen(_onEvent, onError: _onError, onDone: _onDone);
  }

  // ================== EVENT HANDLING ==================
  void _onEvent(dynamic event) {
    if (event is! String) return;

    try {
      final decodedEvent = jsonDecode(event);

      if (decodedEvent is Map<String, dynamic>) {
        // Ping-Pong Keep-Alive
        if (decodedEvent.containsKey('ping')) {
          _handlePingResponse();
          return;
        }

        // ACK Handling
        if (decodedEvent.containsKey('id')) {
          _handleAckEvent(decodedEvent);
          return;
        }

        // Event Type Routing
        final eventType = decodedEvent['e'];
        switch (eventType) {
          case '24hrMiniTicker':
            if (_allMarketsController != null && !_allMarketsController!.isClosed) {}
            break;

          case '24hrTicker':
            // For detail screen (single symbol)
            final symbol = decodedEvent['s'] as String;
            final lowerSymbol = symbol.toLowerCase();

            if (_symbolControllers.containsKey(lowerSymbol) && !_symbolControllers[lowerSymbol]!.isClosed) {
              final ticker = SymbolTickerModel.fromJson(decodedEvent);
              _symbolControllers[lowerSymbol]!.add(ticker);
            }
            break;
        }
      } else if (decodedEvent is List) {
        // For all markets (if array is received)
        if (_allMarketsController != null && !_allMarketsController!.isClosed) {
          final miniTickers = decodedEvent
              .map((item) => MiniTickerModel.fromJson(item as Map<String, dynamic>))
              .toList();
          _allMarketsController!.add(miniTickers);
        }
      }
    } catch (e) {
      debugPrint('JSON decode error: $e');
    }
  }

  //  Ping-Pong Keep-Alive
  void _handlePingResponse() {
    _channel?.sink.add(jsonEncode({'pong': DateTime.now().millisecondsSinceEpoch}));
  }

  //   ACK Handling
  void _handleAckEvent(Map<String, dynamic> response) {
    final requestId = response['id'];
    final completer = _pendingRequests.remove(requestId);

    if (completer != null) {
      if (response.containsKey('code')) {
        debugPrint(" Subscribe Error: ${response['msg']} (Code: ${response['code']})");
        completer.complete(false);
      } else if (response.containsKey('result')) {
        debugPrint(" Subscribe Success");
        completer.complete(response['result'] == null);
      } else {
        completer.complete(false);
      }
    }
  }

  // ================== ERROR HANDLING ==================
  void _onError(dynamic error) {
    debugPrint('WebSocket error: $error');

    if (error is WebSocketChannelException || error is SocketException) {
      debugPrint("Network error detected, reconnecting...");
      reconnect();
    } else if (error is HttpException && error.message.contains("403")) {
      debugPrint("Access denied (403 Forbidden)");
    } else {
      debugPrint("Unknown error: $error");
    }
  }

  void _onDone() {
    debugPrint("Connection closed: ${_channel?.closeReason ?? 'Unknown'}");

    if (_channel?.closeCode != 1000) {
      // 1000 = Normal closure
      reconnect();
    }
  }

  // Reconnect Logic
  @override
  void reconnect() async {
    disconnect();

    if (_reconnectAttempts >= 5) {
      debugPrint("❌ Max reconnection attempts (5) reached");
      return;
    }

    debugPrint("🔄 Reconnecting (${_reconnectAttempts + 1}/5)...");
    _reconnectAttempts++;

    // Exponential backoff
    await Future.delayed(Duration(seconds: 2 * _reconnectAttempts));

    connect();

    if (isConnected) {
      _reconnectAttempts = 0;
      debugPrint("✅ Reconnected successfully");

      // Resubscribe to active streams
      if (_activeStreams.isNotEmpty) {
        debugPrint("🔄 Resubscribing to ${_activeStreams.length} streams...");
        final request = {
          'id': DateTime.now().millisecondsSinceEpoch,
          'method': 'SUBSCRIBE',
          'params': _activeStreams.toList(),
        };
        await _sendRequest(request);
      }
    }
  }

  // ================== SEND REQUEST ==================
  Future<bool> _sendRequest(Map<String, dynamic> request) async {
    if (!isConnected) {
      debugPrint("⚠️ WebSocket not connected");
      return false;
    }

    final completer = Completer<bool>();
    _pendingRequests[request['id']] = completer;
    _channel?.sink.add(jsonEncode(request));

    final isSuccess = await completer.future;

    // Track active streams
    if (isSuccess && request.containsKey('params')) {
      final streamNames = request['params'] as List;
      if (request['method'] == 'SUBSCRIBE') {
        _activeStreams.addAll(streamNames.cast<String>());
      } else if (request['method'] == 'UNSUBSCRIBE') {
        _activeStreams.removeAll(streamNames.cast<String>());
      }
    }

    return isSuccess;
  }

  // ================== ALL MARKETS (List Screen) ==================
  @override
  Stream<List<MiniTickerModel>> connectToMiniTickerStream() {
    if (_allMarketsController != null && !_allMarketsController!.isClosed) {
      return _allMarketsController!.stream;
    }

    _allMarketsController = StreamController<List<MiniTickerModel>>.broadcast();

    return _allMarketsController!.stream;
  }

  @override
  void disconnectAllMarkets() {
    _allMarketsController?.close();
    _allMarketsController = null;
  }

  // ================== SINGLE SYMBOL (Detail Screen) ==================
  @override
  Stream<SymbolTickerModel> connectToSymbolTicker(String symbol) {
    final lowerSymbol = symbol.toLowerCase();

    // Return existing stream if it already exists
    if (_symbolControllers.containsKey(lowerSymbol) && !_symbolControllers[lowerSymbol]!.isClosed) {
      return _symbolControllers[lowerSymbol]!.stream;
    }

    // Create new controller
    _symbolControllers[lowerSymbol] = StreamController<SymbolTickerModel>.broadcast();

    // Send subscribe request
    final streamName = '$lowerSymbol@ticker';
    final request = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'method': 'SUBSCRIBE',
      'params': [streamName],
    };

    _sendRequest(request);

    return _symbolControllers[lowerSymbol]!.stream;
  }

  @override
  void disconnectSymbol(String symbol) {
    final lowerSymbol = symbol.toLowerCase();

    // Send unsubscribe request
    final request = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'method': 'UNSUBSCRIBE',
      'params': ['$lowerSymbol@ticker'],
    };

    _sendRequest(request);

    // Close controller
    _symbolControllers[lowerSymbol]?.close();
    _symbolControllers.remove(lowerSymbol);
  }

  // ================== DISCONNECT ==================
  @override
  void disconnect() {
    // Cancel pending requests
    for (final completer in _pendingRequests.values) {
      if (!completer.isCompleted) {
        completer.complete(false);
      }
    }
    _pendingRequests.clear();

    // Clear active streams
    _activeStreams.clear();

    // Close channel
    _channel?.sink.close();
    _channel = null;
  }

  // ================== DISPOSE ==================
  @override
  void dispose() {
    disconnect();

    disconnectAllMarkets();

    for (var controller in _symbolControllers.values) {
      if (!controller.isClosed) {
        controller.close();
      }
    }
    _symbolControllers.clear();
  }
}
