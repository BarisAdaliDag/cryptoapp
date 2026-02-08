import 'package:cryptoapp/app/client/network/base/api_error.dart';
import 'package:cryptoapp/app/client/network/base/base_network_type_def.dart';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

abstract class ITickerRepository {
  /// İlk yüklemede tüm ticker verisi (REST API)
  ResultDecode<List<TickerModel>, APIError> getAllTickers();

  /// Tek symbol için REST API'den detay
  ResultDecode<TickerModel, APIError> getTickerBySymbol(String symbol);

  /// Arama için ticker filtreleme
  List<TickerModel> searchTickers({required List<TickerModel> tickers, required String query});

  /// WebSocket stream (tüm marketler - liste ekranı)
  Stream<List<MiniTickerModel>> getRealtimeUpdates();

  ///  Tek symbol için WebSocket (detay ekranı)
  Stream<SymbolTickerModel> getSymbolRealtimeUpdates(String symbol);

  /// WebSocket'i kapat (tüm marketler)
  void closeWebSocket();

  ///  Symbol-specific WebSocket'i kapat
  void closeSymbolWebSocket(String symbol);
}
