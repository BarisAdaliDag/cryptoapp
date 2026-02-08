import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';

abstract class IBinanceWebSocketService {
  /// Connection state
  bool get isConnected;

  /// Ana bağlantıyı başlat
  void connect();

  /// Bağlantıyı kapat (tüm stream'ler)
  void disconnect();

  /// Yeniden bağlan (reconnect logic)
  void reconnect();

  /// Tüm kaynakları temizle
  void dispose();

  // ================== ALL MARKETS (Liste Ekranı) ==================

  /// Tüm marketler için mini ticker stream
  Stream<List<MiniTickerModel>> connectToMiniTickerStream();

  /// Tüm marketler WebSocket'ini kapat
  void disconnectAllMarkets();

  // ================== SINGLE SYMBOL (Detay Ekranı) ==================

  /// Tek symbol için detaylı ticker stream (bidPrice/askPrice dahil)
  Stream<SymbolTickerModel> connectToSymbolTicker(String symbol);

  /// Tek symbol WebSocket'ini kapat
  void disconnectSymbol(String symbol);
}
