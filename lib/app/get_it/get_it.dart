import 'package:cryptoapp/data/repository/i_ticker_repository.dart';
import 'package:cryptoapp/data/repository/ticker_repository.dart';
import 'package:cryptoapp/data/services/binance_service.dart';
import 'package:cryptoapp/data/services/binance_websocket_service.dart';
import 'package:cryptoapp/data/services/i_binance_service.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:cryptoapp/presentation/market_detail/viewmodel/market_detail_viewmodel.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// GetIt ile DI kurulumu
void setupGetIt() {
  // Services
  getIt.registerLazySingleton<IBinanceService>(() => BinanceService());
  getIt.registerLazySingleton<BinanceWebSocketService>(() => BinanceWebSocketService());

  // Repository
  getIt.registerLazySingleton<ITickerRepository>(
    () =>
        TickerRepository(binanceService: getIt<IBinanceService>(), websocketService: getIt<BinanceWebSocketService>()),
  );

  // ViewModels
  getIt.registerFactory<MarketListViewModel>(() => MarketListViewModel(getIt<ITickerRepository>()));

  getIt.registerFactoryParam<MarketDetailViewModel, String, void>(
    (symbol, _) => MarketDetailViewModel(getIt<ITickerRepository>(), symbol),
  );
}
