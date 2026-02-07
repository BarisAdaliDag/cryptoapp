// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MiniTickerModelImpl _$$MiniTickerModelImplFromJson(
  Map<String, dynamic> json,
) => _$MiniTickerModelImpl(
  eventType: json['e'] as String,
  eventTime: (json['E'] as num).toInt(),
  symbol: json['s'] as String,
  closePrice: json['c'] as String,
  openPrice: json['o'] as String,
  highPrice: json['h'] as String,
  lowPrice: json['l'] as String,
  volume: json['v'] as String,
  quoteVolume: json['q'] as String,
);

Map<String, dynamic> _$$MiniTickerModelImplToJson(
  _$MiniTickerModelImpl instance,
) => <String, dynamic>{
  'e': instance.eventType,
  'E': instance.eventTime,
  's': instance.symbol,
  'c': instance.closePrice,
  'o': instance.openPrice,
  'h': instance.highPrice,
  'l': instance.lowPrice,
  'v': instance.volume,
  'q': instance.quoteVolume,
};
