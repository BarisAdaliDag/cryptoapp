import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';

abstract class IBinanceWebSocketService {
  bool get isConnected;

  void connect();

  void disconnect();

  void reconnect();

  void dispose();

  // ================== ALL MARKETS (Liste Ekranı) ==================

  Stream<List<MiniTickerModel>> connectToMiniTickerStream();

  void disconnectAllMarkets();

  // ================== SINGLE SYMBOL  ==================

  Stream<SymbolTickerModel> connectToSymbolTicker(String symbol);

  void disconnectSymbol(String symbol);
}
