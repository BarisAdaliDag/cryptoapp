import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/util/format_string_helper';
import '../extensions/ticker_model_extension.dart';

class MarketDetailHelpers {
  MarketDetailHelpers._();

  static String getBaseCoin(String symbol) {
    return symbol.split('/').first;
  }

  static String calculateSpread(TickerModel ticker) {
    final spread = ticker.askPriceAsDouble - ticker.bidPriceAsDouble;
    final spreadPercent = (spread / ticker.lastPriceAsDouble) * 100;
    return '${FormatStringHelper.formatPrice(spread)} (${spreadPercent.toStringAsFixed(2)}%)';
  }

  static String formatTimestamp(int timestamp) {
    if (timestamp == 0) return AppStrings.notAvailable;
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}';
  }
}
