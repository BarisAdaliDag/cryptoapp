import 'package:cryptoapp/data/models/ticker_model.dart';

extension TickerModelExtension on TickerModel {
  double get highPriceAsDouble => double.tryParse(highPrice ?? '0') ?? 0;
  double get lowPriceAsDouble => double.tryParse(lowPrice ?? '0') ?? 0;
  double get volumeAsDouble => double.tryParse(volume ?? '0') ?? 0;
  double get quoteVolumeAsDouble => double.tryParse(quoteVolume ?? '0') ?? 0;
  double get bidPriceAsDouble => double.tryParse(bidPrice ?? '0') ?? 0;
  double get bidQtyAsDouble => double.tryParse(bidQty ?? '0') ?? 0;
  double get askPriceAsDouble => double.tryParse(askPrice ?? '0') ?? 0;
  double get askQtyAsDouble => double.tryParse(askQty ?? '0') ?? 0;
  double get weightedAvgPriceAsDouble => double.tryParse(weightedAvgPrice ?? '0') ?? 0;
  double get openPriceAsDouble => double.tryParse(openPrice ?? '0') ?? 0;
}
