import 'package:cryptoapp/data/repository/i_ticker_repository.dart';
import 'package:cryptoapp/data/repository/ticker_repository.dart';
import 'package:cryptoapp/data/services/binance_service.dart';
import 'package:cryptoapp/data/services/binance_websocket_service.dart';
import 'package:cryptoapp/data/services/i_binance_service.dart';
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
}
