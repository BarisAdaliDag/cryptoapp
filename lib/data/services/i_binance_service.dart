import 'package:cryptoapp/app/client/network/base/base_network_error_type.dart';
import 'package:cryptoapp/app/client/network/base/base_network_type_def.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

abstract class IBinanceService {
  ResultDecode<List<TickerModel>, BaseNetworkErrorType> get24hrTickers();

  ResultDecode<TickerModel, BaseNetworkErrorType> getTickerBySymbol({required String symbol});
}
