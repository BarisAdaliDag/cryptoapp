import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';
import 'package:cryptoapp/data/services/i_binance_websocket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketService implements IBinanceWebSocketService {
  // ================== ALL MARKETS CONNECTION (Ayrı) ==================
  WebSocketChannel? _allMarketsChannel;
  StreamController<List<MiniTickerModel>>? _allMarketsController;

  // ================== SINGLE SYMBOL CONNECTION (Ana) ==================
  WebSocketChannel? _channel;
  final Map<String, StreamController<SymbolTickerModel>> _symbolControllers = {};

  @override
  bool get isConnected => _channel != null && _channel!.closeCode == null;

  int _reconnectAttempts = 0;

  // ================== REQUEST TRACKING ==================
  final Map<int, Completer<bool>> _pendingRequests = {};
  final Set<String> _activeStreams = {};

  // ================== ALL MARKETS STREAM ==================
  @override
  Stream<List<MiniTickerModel>> connectToMiniTickerStream() {
    if (_allMarketsController != null && !_allMarketsController!.isClosed) {
      return _allMarketsController!.stream;
    }

    _allMarketsController = StreamController<List<MiniTickerModel>>.broadcast();

    // ✅ Ayrı bir WebSocket connection aç (tüm marketler için)
    _allMarketsChannel = WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws/!miniTicker@arr'));

    print('🔌 Connecting to all markets mini ticker stream...');

    _allMarketsChannel!.stream.listen(
      (data) {
        try {
          if (data is! String) return;

          final decoded = jsonDecode(data);

          if (decoded is List) {
            final miniTickers = decoded.map((item) => MiniTickerModel.fromJson(item as Map<String, dynamic>)).toList();

            print('✅ Received ${miniTickers.length} mini tickers');

            if (_allMarketsController != null && !_allMarketsController!.isClosed) {
              _allMarketsController!.add(miniTickers);
            }
          }
        } catch (e) {
          print('❌ MiniTicker parse error: $e');
        }
      },
      onError: (error) {
        print('❌ MiniTicker error: $error');
      },
      onDone: () {
        print('🔌 MiniTicker connection closed');
      },
    );

    return _allMarketsController!.stream;
  }

  @override
  void disconnectAllMarkets() {
    _allMarketsChannel?.sink.close();
    _allMarketsChannel = null;
    _allMarketsController?.close();
    _allMarketsController = null;
    print('🔌 All markets connection closed');
  }

  // ================== SINGLE SYMBOL STREAM ==================
  @override
  Stream<SymbolTickerModel> connectToSymbolTicker(String symbol) {
    final lowerSymbol = symbol.toLowerCase();

    if (_symbolControllers.containsKey(lowerSymbol) && !_symbolControllers[lowerSymbol]!.isClosed) {
      return _symbolControllers[lowerSymbol]!.stream;
    }

    _symbolControllers[lowerSymbol] = StreamController<SymbolTickerModel>.broadcast();

    // Ana connection'ı başlat (henüz başlamamışsa)
    if (!isConnected) {
      _connect();
    }

    // Subscribe request gönder
    final streamName = '$lowerSymbol@ticker';
    final request = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'method': 'SUBSCRIBE',
      'params': [streamName],
    };

    Future.delayed(Duration(milliseconds: 500), () {
      _sendRequest(request);
    });

    return _symbolControllers[lowerSymbol]!.stream;
  }

  // ================== MAIN CONNECTION (Symbol-specific için) ==================
  @override
  void connect() {
    _connect();
  }

  void _connect() {
    if (_channel != null) return;

    _channel = WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws'));

    print('🔌 Connecting to symbol-specific stream...');

    _channel!.stream.listen(_onEvent, onError: _onError, onDone: _onDone);
  }

  void _onEvent(dynamic event) {
    if (event is! String) return;

    try {
      final decodedEvent = jsonDecode(event);

      if (decodedEvent is Map<String, dynamic>) {
        // Ping-Pong
        if (decodedEvent.containsKey('ping')) {
          _handlePingResponse();
          return;
        }

        // ACK
        if (decodedEvent.containsKey('id')) {
          _handleAckEvent(decodedEvent);
          return;
        }

        // Event routing
        final eventType = decodedEvent['e'];
        if (eventType == '24hrTicker') {
          final symbol = decodedEvent['s'] as String;
          final lowerSymbol = symbol.toLowerCase();

          if (_symbolControllers.containsKey(lowerSymbol) && !_symbolControllers[lowerSymbol]!.isClosed) {
            final ticker = SymbolTickerModel.fromJson(decodedEvent);
            print('✅ Received ticker update for $symbol: ${ticker.lastPrice}');
            _symbolControllers[lowerSymbol]!.add(ticker);
          }
        }
      }
    } catch (e) {
      print('❌ JSON decode error: $e');
    }
  }

  void _handlePingResponse() {
    _channel?.sink.add(jsonEncode({'pong': DateTime.now().millisecondsSinceEpoch}));
  }

  void _handleAckEvent(Map<String, dynamic> response) {
    final requestId = response['id'];
    final completer = _pendingRequests.remove(requestId);

    if (completer != null) {
      if (response.containsKey('code')) {
        print("❌ Subscribe Error: ${response['msg']} (Code: ${response['code']})");
        completer.complete(false);
      } else if (response.containsKey('result')) {
        print("✅ Subscribe Success");
        completer.complete(response['result'] == null);
      } else {
        completer.complete(false);
      }
    }
  }

  Future<bool> _sendRequest(Map<String, dynamic> request) async {
    if (!isConnected) {
      print("❌ WebSocket not connected");
      return false;
    }

    final completer = Completer<bool>();
    _pendingRequests[request['id']] = completer;
    _channel?.sink.add(jsonEncode(request));

    final isSuccess = await completer.future;

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

  // ================== ERROR HANDLING ==================
  void _onError(dynamic error) {
    print('❌ WebSocket error: $error');

    if (error is WebSocketChannelException || error is SocketException) {
      reconnect();
    }
  }

  void _onDone() {
    print("🔌 Connection closed");

    if (_channel?.closeCode != 1000) {
      reconnect();
    }
  }

  @override
  void reconnect() async {
    disconnect();

    if (_reconnectAttempts >= 5) {
      print("❌ Max reconnection attempts reached");
      return;
    }

    print("🔄 Reconnecting (${_reconnectAttempts + 1}/5)...");
    _reconnectAttempts++;
    await Future.delayed(Duration(seconds: 2 * _reconnectAttempts));

    _connect();

    if (isConnected) {
      _reconnectAttempts = 0;
      print("✅ Reconnected");

      if (_activeStreams.isNotEmpty) {
        final request = {
          'id': DateTime.now().millisecondsSinceEpoch,
          'method': 'SUBSCRIBE',
          'params': _activeStreams.toList(),
        };
        await _sendRequest(request);
      }
    }
  }

  @override
  void disconnect() {
    for (final completer in _pendingRequests.values) {
      if (!completer.isCompleted) {
        completer.complete(false);
      }
    }
    _pendingRequests.clear();
    _activeStreams.clear();
    _channel?.sink.close();
    _channel = null;
  }

  @override
  void disconnectSymbol(String symbol) {
    final lowerSymbol = symbol.toLowerCase();

    final request = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'method': 'UNSUBSCRIBE',
      'params': ['$lowerSymbol@ticker'],
    };

    _sendRequest(request);

    _symbolControllers[lowerSymbol]?.close();
    _symbolControllers.remove(lowerSymbol);
  }

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
