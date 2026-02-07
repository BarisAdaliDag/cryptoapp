import 'package:cryptoapp/app/client/network/base/api_error.dart';
import 'package:cryptoapp/app/client/network/base/base_network_type_def.dart';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

abstract class ITickerRepository {
  /// İlk yüklemede tüm ticker verisi (REST API)
  ResultDecode<List<TickerModel>, APIError> getAllTickers();

  /// Arama için ticker filtreleme
  List<TickerModel> searchTickers({required List<TickerModel> tickers, required String query});

  /// WebSocket stream (gerçek zamanlı güncellemeler)
  Stream<List<MiniTickerModel>> getRealtimeUpdates();

  /// WebSocket'i kapat
  void closeWebSocket();
}
