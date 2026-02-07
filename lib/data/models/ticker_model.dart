import 'package:cryptoapp/app/client/network/base/base_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticker_model.freezed.dart';
part 'ticker_model.g.dart';

@freezed
class TickerModel with _$TickerModel implements BaseResponseModel<TickerModel> {
  const TickerModel._();

  const factory TickerModel({
    String? symbol,
    String? priceChange,
    String? priceChangePercent,
    String? weightedAvgPrice,
    String? prevClosePrice,
    String? lastPrice,
    String? lastQty,
    String? bidPrice,
    String? bidQty,
    String? askPrice,
    String? askQty,
    String? openPrice,
    String? highPrice,
    String? lowPrice,
    String? volume,
    String? quoteVolume,
    int? openTime,
    int? closeTime,
    int? firstId,
    int? lastId,
    int? count,
  }) = _TickerModel;

  factory TickerModel.fromJson(Map<String, dynamic> json) => _$TickerModelFromJson(json);

  @override
  TickerModel fromJson(Map<String, dynamic> json) => _$TickerModelFromJson(json);

  // Computed properties (nullable-safe)
  bool get isPriceUp => (double.tryParse(priceChange ?? '0') ?? 0) > 0;

  String get displaySymbol => symbol?.replaceAll('USDT', '/USDT') ?? '';

  double get lastPriceAsDouble => double.tryParse(lastPrice ?? '0') ?? 0;

  double get priceChangePercentAsDouble => double.tryParse(priceChangePercent ?? '0') ?? 0;
}
