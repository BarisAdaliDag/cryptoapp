import 'dart:async';
import 'dart:convert';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';
import 'package:cryptoapp/data/services/i_binance_websocket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketService implements IBinanceWebSocketService {
  // ================== TÜM MARKETLER (Liste Ekranı) ==================
  WebSocketChannel? _allMarketsChannel;
  StreamController<List<MiniTickerModel>>? _allMarketsController;

  @override
  Stream<List<MiniTickerModel>> connectToMiniTickerStream() {
    if (_allMarketsController != null && !_allMarketsController!.isClosed) {
      return _allMarketsController!.stream;
    }

    _allMarketsController = StreamController<List<MiniTickerModel>>.broadcast();

    try {
      _allMarketsChannel = WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws/!miniTicker@arr'));

      _allMarketsChannel!.stream.listen(
        (data) {
          try {
            final List<dynamic> jsonList = json.decode(data);
            final miniTickers = jsonList.map((item) => MiniTickerModel.fromJson(item as Map<String, dynamic>)).toList();

            if (!_allMarketsController!.isClosed) {
              _allMarketsController!.add(miniTickers);
            }
          } catch (e) {
            if (!_allMarketsController!.isClosed) {
              _allMarketsController!.addError('JSON parse error: $e');
            }
          }
        },
        onError: (error) {
          if (!_allMarketsController!.isClosed) {
            _allMarketsController!.addError('WebSocket error: $error');
          }
          disconnectAllMarkets();
        },
        onDone: disconnectAllMarkets,
      );
    } catch (e) {
      _allMarketsController!.addError('Connection error: $e');
    }

    return _allMarketsController!.stream;
  }

  @override
  void disconnectAllMarkets() {
    _allMarketsChannel?.sink.close();
    _allMarketsChannel = null;
    _allMarketsController?.close();
    _allMarketsController = null;
  }

  // ================== TEK SYMBOL (Detay Ekranı) ==================
  final Map<String, WebSocketChannel> _symbolChannels = {};
  final Map<String, StreamController<SymbolTickerModel>> _symbolControllers = {};

  @override
  Stream<SymbolTickerModel> connectToSymbolTicker(String symbol) {
    final lowerSymbol = symbol.toLowerCase();

    if (_symbolControllers.containsKey(lowerSymbol) && !_symbolControllers[lowerSymbol]!.isClosed) {
      return _symbolControllers[lowerSymbol]!.stream;
    }

    _symbolControllers[lowerSymbol] = StreamController<SymbolTickerModel>.broadcast();

    try {
      _symbolChannels[lowerSymbol] = WebSocketChannel.connect(
        Uri.parse('wss://stream.binance.com:9443/ws/$lowerSymbol@ticker'),
      );

      _symbolChannels[lowerSymbol]!.stream.listen(
        (data) {
          try {
            final jsonData = jsonDecode(data) as Map<String, dynamic>;
            final ticker = SymbolTickerModel.fromJson(jsonData);

            if (!_symbolControllers[lowerSymbol]!.isClosed) {
              _symbolControllers[lowerSymbol]!.add(ticker);
            }
          } catch (e) {
            if (!_symbolControllers[lowerSymbol]!.isClosed) {
              _symbolControllers[lowerSymbol]!.addError('Parse error: $e');
            }
          }
        },
        onError: (error) {
          if (!_symbolControllers[lowerSymbol]!.isClosed) {
            _symbolControllers[lowerSymbol]!.addError('WebSocket error: $error');
          }
          disconnectSymbol(symbol);
        },
        onDone: () => disconnectSymbol(symbol),
      );
    } catch (e) {
      _symbolControllers[lowerSymbol]!.addError('Connection error: $e');
    }

    return _symbolControllers[lowerSymbol]!.stream;
  }

  @override
  void disconnectSymbol(String symbol) {
    final lowerSymbol = symbol.toLowerCase();
    _symbolChannels[lowerSymbol]?.sink.close();
    _symbolChannels.remove(lowerSymbol);
    _symbolControllers[lowerSymbol]?.close();
    _symbolControllers.remove(lowerSymbol);
  }

  @override
  void dispose() {
    disconnectAllMarkets();
    for (var channel in _symbolChannels.values) {
      channel.sink.close();
    }
    _symbolChannels.clear();
    for (var controller in _symbolControllers.values) {
      controller.close();
    }
    _symbolControllers.clear();
  }
}
