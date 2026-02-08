// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol_ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SymbolTickerModelImpl _$$SymbolTickerModelImplFromJson(
  Map<String, dynamic> json,
) => _$SymbolTickerModelImpl(
  eventType: json['e'] as String,
  eventTime: (json['E'] as num).toInt(),
  symbol: json['s'] as String,
  priceChange: json['p'] as String,
  priceChangePercent: json['P'] as String,
  weightedAvgPrice: json['w'] as String,
  lastPrice: json['c'] as String,
  lastQty: json['Q'] as String,
  bidPrice: json['b'] as String,
  bidQty: json['B'] as String,
  askPrice: json['a'] as String,
  askQty: json['A'] as String,
  openPrice: json['o'] as String,
  highPrice: json['h'] as String,
  lowPrice: json['l'] as String,
  volume: json['v'] as String,
  quoteVolume: json['q'] as String,
  openTime: (json['O'] as num).toInt(),
  closeTime: (json['C'] as num).toInt(),
  firstId: (json['F'] as num).toInt(),
  lastId: (json['L'] as num).toInt(),
  count: (json['n'] as num).toInt(),
);

Map<String, dynamic> _$$SymbolTickerModelImplToJson(
  _$SymbolTickerModelImpl instance,
) => <String, dynamic>{
  'e': instance.eventType,
  'E': instance.eventTime,
  's': instance.symbol,
  'p': instance.priceChange,
  'P': instance.priceChangePercent,
  'w': instance.weightedAvgPrice,
  'c': instance.lastPrice,
  'Q': instance.lastQty,
  'b': instance.bidPrice,
  'B': instance.bidQty,
  'a': instance.askPrice,
  'A': instance.askQty,
  'o': instance.openPrice,
  'h': instance.highPrice,
  'l': instance.lowPrice,
  'v': instance.volume,
  'q': instance.quoteVolume,
  'O': instance.openTime,
  'C': instance.closeTime,
  'F': instance.firstId,
  'L': instance.lastId,
  'n': instance.count,
};
