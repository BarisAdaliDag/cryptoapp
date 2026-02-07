import 'package:cryptoapp/app/client/network/base/base_response_model.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mini_ticker_model.freezed.dart';
part 'mini_ticker_model.g.dart';

@freezed
class MiniTickerModel with _$MiniTickerModel implements BaseResponseModel<MiniTickerModel> {
  const MiniTickerModel._();

  const factory MiniTickerModel({
    @JsonKey(name: 'e') required String eventType,
    @JsonKey(name: 'E') required int eventTime,
    @JsonKey(name: 's') required String symbol,
    @JsonKey(name: 'c') required String closePrice,
    @JsonKey(name: 'o') required String openPrice,
    @JsonKey(name: 'h') required String highPrice,
    @JsonKey(name: 'l') required String lowPrice,
    @JsonKey(name: 'v') required String volume,
    @JsonKey(name: 'q') required String quoteVolume,
  }) = _MiniTickerModel;

  factory MiniTickerModel.fromJson(Map<String, dynamic> json) => _$MiniTickerModelFromJson(json);

  // ✅ BaseResponseModel implementation
  @override
  MiniTickerModel fromJson(Map<String, dynamic> json) => _$MiniTickerModelFromJson(json);

  // WebSocket → REST model conversion (merge için)
  TickerModel toTickerModel() {
    final priceChange = (double.tryParse(closePrice) ?? 0) - (double.tryParse(openPrice) ?? 0);
    final priceChangePercent = (priceChange / (double.tryParse(openPrice) ?? 1)) * 100;

    return TickerModel(
      symbol: symbol,
      lastPrice: closePrice,
      openPrice: openPrice,
      highPrice: highPrice,
      lowPrice: lowPrice,
      volume: volume,
      quoteVolume: quoteVolume,
      priceChange: priceChange.toStringAsFixed(8),
      priceChangePercent: priceChangePercent.toStringAsFixed(2),
      weightedAvgPrice: '0',
      prevClosePrice: openPrice,
      lastQty: '0',
      bidPrice: '0',
      bidQty: '0',
      askPrice: '0',
      askQty: '0',
      openTime: eventTime - 86400000,
      closeTime: eventTime,
      firstId: 0,
      lastId: 0,
      count: 0,
    );
  }
}
