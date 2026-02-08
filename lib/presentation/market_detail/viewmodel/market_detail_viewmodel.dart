import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/data/repository/i_ticker_repository.dart';

class MarketDetailViewModel extends ChangeNotifier {
  final ITickerRepository _repository;
  final String symbol;

  MarketDetailViewModel(this._repository, this.symbol);

  // ===================== STATE =====================
  TickerModel? _ticker;
  bool _isLoading = false;
  String? _error;
  StreamSubscription? _wsSubscription;

  // ===================== GETTERS =====================
  TickerModel? get ticker => _ticker;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get hasData => _ticker != null;

  // ===================== PUBLIC METHODS =====================

  /// İlk yükleme: REST API'den ticker detayını çek
  Future<void> loadTickerDetail() async {
    _setLoading(true);
    _error = null;

    final result = await _repository.getTickerBySymbol(symbol);

    result.when(
      success: (data) {
        _ticker = data;
        _startRealtimeUpdates(); // WebSocket'i başlat
      },
      failure: (error) {
        _error = error.meta?.infoList?.first.message ?? 'Bir hata oluştu';
      },
    );

    _setLoading(false);
  }

  /// Yenile
  Future<void> refresh() async {
    await loadTickerDetail();
  }

  // ===================== PRIVATE METHODS =====================

  /// WebSocket stream'ini dinle ve güncelle
  /// ✅ Bu stream bidPrice ve askPrice içerir!
  void _startRealtimeUpdates() {
    _wsSubscription?.cancel();

    _wsSubscription = _repository
        .getSymbolRealtimeUpdates(symbol)
        .listen(
          (symbolTicker) {
            // SymbolTickerModel → TickerModel dönüşümü
            _ticker = symbolTicker.toTickerModel();
            notifyListeners();
          },
          onError: (error) {
            _error = 'WebSocket bağlantısı kesildi';
            notifyListeners();
          },
        );
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // ===================== DISPOSE =====================

  @override
  void dispose() {
    _wsSubscription?.cancel();
    _repository.closeSymbolWebSocket(symbol);
    super.dispose();
  }
}
