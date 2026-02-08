import 'package:cryptoapp/app/client/network/base/api_error.dart';
import 'package:cryptoapp/app/client/network/base/base_network_type_def.dart';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

abstract class ITickerRepository {
  ResultDecode<List<TickerModel>, APIError> getAllTickers();

  ResultDecode<TickerModel, APIError> getTickerBySymbol(String symbol);

  List<TickerModel> searchTickers({required List<TickerModel> tickers, required String query});

  Stream<List<MiniTickerModel>> getRealtimeUpdates();

  Stream<SymbolTickerModel> getSymbolRealtimeUpdates(String symbol);

  void closeWebSocket();

  void closeSymbolWebSocket(String symbol);
}
