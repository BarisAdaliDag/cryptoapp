import 'package:cryptoapp/app/client/network/base/api_error.dart';
import 'package:cryptoapp/app/client/network/base/base_network_type_def.dart';
import 'package:cryptoapp/app/client/result/result.dart';
import 'package:cryptoapp/data/models/mini_ticker_model.dart';
import 'package:cryptoapp/data/models/symbol_ticker_model.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/data/repository/i_ticker_repository.dart';
import 'package:cryptoapp/data/services/i_binance_service.dart';
import 'package:cryptoapp/data/services/i_binance_websocket_service.dart';

class TickerRepository extends ITickerRepository {
  final IBinanceService binanceService;
  final IBinanceWebSocketService websocketService;

  TickerRepository({required this.binanceService, required this.websocketService});

  @override
  ResultDecode<List<TickerModel>, APIError> getAllTickers() async {
    final response = await binanceService.get24hrTickers();
    return response.when(
      success: (data) {
        final usdtPairs = data.where((ticker) => ticker.symbol?.endsWith('USDT') ?? false).toList();
        return Result.success(usdtPairs);
      },
      failure: (error) => Result.failure(error.handleApiError),
    );
  }

  @override
  ResultDecode<TickerModel, APIError> getTickerBySymbol(String symbol) async {
    final response = await binanceService.getTickerBySymbol(symbol: symbol);
    return response.when(
      success: (data) => Result.success(data),
      failure: (error) => Result.failure(error.handleApiError),
    );
  }

  @override
  List<TickerModel> searchTickers({required List<TickerModel> tickers, required String query}) {
    if (query.isEmpty) return tickers;

    final lowerQuery = query.toLowerCase();
    return tickers.where((ticker) {
      final baseAsset = ticker.symbol?.replaceAll('USDT', '') ?? '';
      return (ticker.symbol?.toLowerCase().contains(lowerQuery) ?? false) ||
          baseAsset.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  @override
  Stream<List<MiniTickerModel>> getRealtimeUpdates() {
    return websocketService.connectToMiniTickerStream().map((tickers) {
      return tickers.where((ticker) => ticker.symbol.endsWith('USDT')).toList();
    });
  }

  @override
  Stream<SymbolTickerModel> getSymbolRealtimeUpdates(String symbol) {
    return websocketService.connectToSymbolTicker(symbol);
  }

  @override
  void closeWebSocket() {
    websocketService.disconnectAllMarkets();
  }

  @override
  void closeSymbolWebSocket(String symbol) {
    websocketService.disconnectSymbol(symbol);
  }
}
