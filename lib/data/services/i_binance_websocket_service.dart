import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';

abstract class IBinanceWebSocketService {
  /// Tüm marketler için mini ticker stream
  Stream<List<MiniTickerModel>> connectToMiniTickerStream();

  /// Tek symbol için detaylı ticker stream (bidPrice/askPrice dahil)
  Stream<SymbolTickerModel> connectToSymbolTicker(String symbol);

  /// Tüm marketler WebSocket'ini kapat
  void disconnectAllMarkets();

  /// Tek symbol WebSocket'ini kapat
  void disconnectSymbol(String symbol);

  /// Tüm kaynakları temizle
  void dispose();
}
