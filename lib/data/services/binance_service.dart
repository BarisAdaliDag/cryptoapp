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
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: '/api/v3/ticker/24hr')
        .execute<TickerModel, List<TickerModel>>(
          const TickerModel(
            symbol: '',
            priceChange: '',
            priceChangePercent: '',
            weightedAvgPrice: '',
            prevClosePrice: '',
            lastPrice: '',
            lastQty: '',
            bidPrice: '',
            bidQty: '',
            askPrice: '',
            askQty: '',
            openPrice: '',
            highPrice: '',
            lowPrice: '',
            volume: '',
            quoteVolume: '',
            openTime: 0,
            closeTime: 0,
            firstId: 0,
            lastId: 0,
            count: 0,
          ),
        );
    return response;
  }

  @override
  ResultDecode<TickerModel, BaseNetworkErrorType> getTickerBySymbol({required String symbol}) async {
    final client = BinanceNetworkClient.client();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: '/api/v3/ticker/24hr')
        .setQueryParameters(queryParameters: {'symbol': symbol.toUpperCase()})
        .execute<TickerModel, TickerModel>(
          const TickerModel(
            symbol: '',
            priceChange: '',
            priceChangePercent: '',
            weightedAvgPrice: '',
            prevClosePrice: '',
            lastPrice: '',
            lastQty: '',
            bidPrice: '',
            bidQty: '',
            askPrice: '',
            askQty: '',
            openPrice: '',
            highPrice: '',
            lowPrice: '',
            volume: '',
            quoteVolume: '',
            openTime: 0,
            closeTime: 0,
            firstId: 0,
            lastId: 0,
            count: 0,
          ),
        );
    return response;
  }
}
