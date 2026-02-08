import 'package:cryptoapp/app/client/network/base/base_response_model.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_ticker_model.freezed.dart';
part 'symbol_ticker_model.g.dart';

@freezed
class SymbolTickerModel with _$SymbolTickerModel implements BaseResponseModel<SymbolTickerModel> {
  const SymbolTickerModel._();

  const factory SymbolTickerModel({
    @JsonKey(name: 'e') required String eventType,
    @JsonKey(name: 'E') required int eventTime,
    @JsonKey(name: 's') required String symbol,
    @JsonKey(name: 'p') required String priceChange,
    @JsonKey(name: 'P') required String priceChangePercent,
    @JsonKey(name: 'w') required String weightedAvgPrice,
    @JsonKey(name: 'c') required String lastPrice,
    @JsonKey(name: 'Q') required String lastQty,
    @JsonKey(name: 'b') required String bidPrice, //extra
    @JsonKey(name: 'B') required String bidQty,
    @JsonKey(name: 'a') required String askPrice, //extra
    @JsonKey(name: 'A') required String askQty,
    @JsonKey(name: 'o') required String openPrice,
    @JsonKey(name: 'h') required String highPrice,
    @JsonKey(name: 'l') required String lowPrice,
    @JsonKey(name: 'v') required String volume,
    @JsonKey(name: 'q') required String quoteVolume,
    @JsonKey(name: 'O') required int openTime,
    @JsonKey(name: 'C') required int closeTime,
    @JsonKey(name: 'F') required int firstId,
    @JsonKey(name: 'L') required int lastId,
    @JsonKey(name: 'n') required int count,
  }) = _SymbolTickerModel;

  factory SymbolTickerModel.fromJson(Map<String, dynamic> json) => _$SymbolTickerModelFromJson(json);

  @override
  SymbolTickerModel fromJson(Map<String, dynamic> json) => _$SymbolTickerModelFromJson(json);

  TickerModel toTickerModel() {
    return TickerModel(
      symbol: symbol,
      priceChange: priceChange,
      priceChangePercent: priceChangePercent,
      weightedAvgPrice: weightedAvgPrice,
      prevClosePrice: openPrice,
      lastPrice: lastPrice,
      lastQty: lastQty,
      bidPrice: bidPrice,
      bidQty: bidQty,
      askPrice: askPrice,
      askQty: askQty,
      openPrice: openPrice,
      highPrice: highPrice,
      lowPrice: lowPrice,
      volume: volume,
      quoteVolume: quoteVolume,
      openTime: openTime,
      closeTime: closeTime,
      firstId: firstId,
      lastId: lastId,
      count: count,
    );
  }
}
