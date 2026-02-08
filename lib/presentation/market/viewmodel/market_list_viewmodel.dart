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

  /// first load: fetch tickers from REST API
  Future<void> loadTickers() async {
    _setLoading(true);
    _error = null;

    final result = await _repository.getAllTickers();

    result.when(
      success: (data) {
        _tickers = data;
        _filteredTickers = data;
        _startRealtimeUpdates(); // WebSocket
      },
      failure: (error) {
        _error = error.meta?.infoList?.first.message ?? 'Bir hata oluştu.';
      },
    );

    _setLoading(false);
  }

  void searchTickers(String query) {
    _searchQuery = query;
    _filteredTickers = _repository.searchTickers(tickers: _tickers, query: query);
    notifyListeners();
  }

  ///  (pull-to-refresh)
  Future<void> refresh() async {
    await loadTickers();
  }

  // ===================== PRIVATE METHODS =====================

  /// WebSocket stream listen and update
  void _startRealtimeUpdates() {
    _wsSubscription?.cancel();

    _wsSubscription = _repository.getRealtimeUpdates().listen(
      (miniTickers) {
        // Apply each WebSocket update to the current list
        for (final miniTicker in miniTickers) {
          final index = _tickers.indexWhere((t) => t.symbol == miniTicker.symbol);

          if (index != -1) {
            _tickers[index] = miniTicker.toTickerModel();
          }
        }

        if (_searchQuery.isNotEmpty) {
          _filteredTickers = _repository.searchTickers(tickers: _tickers, query: _searchQuery);
        } else {
          _filteredTickers = List.from(_tickers);
        }

        notifyListeners();
      },
      onError: (error) {
        debugPrint('WebSocket error (ignored): $error');
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
