import 'package:cryptoapp/app/client/client.dart';
import 'package:cryptoapp/app/client/network/base/base_network_error_type.dart';
import 'package:cryptoapp/app/client/network/base/base_network_type_def.dart';
import 'package:cryptoapp/app/client/network/enum/request_method_enum.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/data/services/i_binance_service.dart';

class BinanceService extends IBinanceService {
  @override
  ResultDecode<List<TickerModel>, BaseNetworkErrorType> get24hrTickers() async {
    final client = BinanceNetworkClient.client();
    return await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: '/api/v3/ticker/24hr')
        .execute<TickerModel, List<TickerModel>>(TickerModel.empty());
  }

  @override
  ResultDecode<TickerModel, BaseNetworkErrorType> getTickerBySymbol({required String symbol}) async {
    final client = BinanceNetworkClient.client();
    return await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: '/api/v3/ticker/24hr')
        .setQueryParameters(queryParameters: {'symbol': symbol.toUpperCase()})
        .execute<TickerModel, TickerModel>(TickerModel.empty());
  }
}
