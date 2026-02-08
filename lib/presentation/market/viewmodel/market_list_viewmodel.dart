import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/data/repository/i_ticker_repository.dart';

class MarketListViewModel extends ChangeNotifier {
  final ITickerRepository _repository;

  MarketListViewModel(this._repository);

  // ===================== STATE =====================
  List<TickerModel> _tickers = [];
  List<TickerModel> _filteredTickers = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';
  StreamSubscription? _wsSubscription;

  // ===================== GETTERS =====================
  List<TickerModel> get tickers => _filteredTickers;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get isEmpty => !_isLoading && _filteredTickers.isEmpty;

  // ===================== PUBLIC METHODS =====================

  /// İlk yükleme: REST API'den tüm ticker'ları çek
  Future<void> loadTickers() async {
    _setLoading(true);
    _error = null;

    final result = await _repository.getAllTickers();

    result.when(
      success: (data) {
        _tickers = data;
        _filteredTickers = data;
        _startRealtimeUpdates(); // WebSocket'i başlat
      },
      failure: (error) {
        _error = error.meta?.infoList?.first.message ?? 'Bir hata oluştu';
      },
    );

    _setLoading(false);
  }

  /// Arama
  void searchTickers(String query) {
    _searchQuery = query;
    _filteredTickers = _repository.searchTickers(tickers: _tickers, query: query);
    notifyListeners();
  }

  /// Yenile (pull-to-refresh)
  Future<void> refresh() async {
    await loadTickers();
  }

  // ===================== PRIVATE METHODS =====================

  /// WebSocket stream'ini dinle ve merge et
  void _startRealtimeUpdates() {
    _wsSubscription?.cancel(); // Önceki subscription varsa iptal et

    _wsSubscription = _repository.getRealtimeUpdates().listen(
      (miniTickers) {
        // Her bir WebSocket güncellemesini mevcut listeye uygula
        for (final miniTicker in miniTickers) {
          final index = _tickers.indexWhere((t) => t.symbol == miniTicker.symbol);

          if (index != -1) {
            _tickers[index] = miniTicker.toTickerModel();
          }
        }

        // Arama aktifse filtreyi tekrar uygula
        if (_searchQuery.isNotEmpty) {
          _filteredTickers = _repository.searchTickers(tickers: _tickers, query: _searchQuery);
        } else {
          _filteredTickers = List.from(_tickers);
        }

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
    _repository.closeWebSocket();
    super.dispose();
  }
}
