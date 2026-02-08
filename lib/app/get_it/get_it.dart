import 'package:cryptoapp/data/repository/i_ticker_repository.dart';
import 'package:cryptoapp/data/repository/ticker_repository.dart';
import 'package:cryptoapp/data/services/binance_service.dart';
import 'package:cryptoapp/data/services/binance_websocket_service.dart';
import 'package:cryptoapp/data/services/i_binance_service.dart';

/// Basit DI container (GetIt kullanmadan)
class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  // Services (Singleton)
  late final IBinanceService _binanceService;
  late final BinanceWebSocketService _websocketService;

  // Repository (Singleton)
  late final ITickerRepository _tickerRepository;

  /// Initialize all dependencies
  void init() {
    // Services
    _binanceService = BinanceService();
    _websocketService = BinanceWebSocketService();

    // Repository
    _tickerRepository = TickerRepository(binanceService: _binanceService, websocketService: _websocketService);
  }

  // Getters
  ITickerRepository get tickerRepository => _tickerRepository;
}

// Global accessor
final serviceLocator = ServiceLocator();
