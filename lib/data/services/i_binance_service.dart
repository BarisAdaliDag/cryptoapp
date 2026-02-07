import 'package:cryptoapp/app/client/network/base/base_network_error_type.dart';
import 'package:cryptoapp/app/client/network/base/base_network_type_def.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

abstract class IBinanceService {
  /// Tüm USDT pairlerinin 24hr ticker verisi
  ResultDecode<List<TickerModel>, BaseNetworkErrorType> get24hrTickers();

  /// Tek bir symbol için 24hr ticker
  ResultDecode<TickerModel, BaseNetworkErrorType> getTickerBySymbol({required String symbol});
}
