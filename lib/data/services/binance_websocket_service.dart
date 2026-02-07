import 'dart:async';
import 'dart:convert';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketService {
  WebSocketChannel? _channel;
  Stream<List<MiniTickerModel>>? _stream;
  final _errorController = StreamController<String>.broadcast();

  /// ✅ Error stream (ViewModel'de dinlenebilir)
  Stream<String> get errorStream => _errorController.stream;

  Stream<List<MiniTickerModel>> connectToMiniTickerStream() {
    if (_stream != null) return _stream!;

    try {
      _channel = WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws/!miniTicker@arr'));

      _stream = _channel!.stream
          .map((data) {
            try {
              final List<dynamic> jsonList = json.decode(data);
              return jsonList.map((item) => MiniTickerModel.fromJson(item as Map<String, dynamic>)).toList();
            } catch (e) {
              _errorController.add('JSON parse error: $e');
              return <MiniTickerModel>[];
            }
          })
          .where((list) => list.isNotEmpty)
          .handleError((error) {
            _errorController.add('WebSocket error: $error');
            disconnect();
          });

      return _stream!;
    } catch (e) {
      _errorController.add('Connection error: $e');
      return Stream.value([]);
    }
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
    _stream = null;
  }

  void dispose() {
    disconnect();
    _errorController.close();
  }
}
