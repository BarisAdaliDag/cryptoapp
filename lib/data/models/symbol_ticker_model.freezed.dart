// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symbol_ticker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SymbolTickerModel _$SymbolTickerModelFromJson(Map<String, dynamic> json) {
  return _SymbolTickerModel.fromJson(json);
}

/// @nodoc
mixin _$SymbolTickerModel {
  @JsonKey(name: 'e')
  String get eventType => throw _privateConstructorUsedError;
  @JsonKey(name: 'E')
  int get eventTime => throw _privateConstructorUsedError;
  @JsonKey(name: 's')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'p')
  String get priceChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'P')
  String get priceChangePercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'w')
  String get weightedAvgPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'c')
  String get lastPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'Q')
  String get lastQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'b')
  String get bidPrice => throw _privateConstructorUsedError; //extra
  @JsonKey(name: 'B')
  String get bidQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'a')
  String get askPrice => throw _privateConstructorUsedError; //extra
  @JsonKey(name: 'A')
  String get askQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'o')
  String get openPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'h')
  String get highPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'l')
  String get lowPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'v')
  String get volume => throw _privateConstructorUsedError;
  @JsonKey(name: 'q')
  String get quoteVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'O')
  int get openTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'C')
  int get closeTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'F')
  int get firstId => throw _privateConstructorUsedError;
  @JsonKey(name: 'L')
  int get lastId => throw _privateConstructorUsedError;
  @JsonKey(name: 'n')
  int get count => throw _privateConstructorUsedError;

  /// Serializes this SymbolTickerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SymbolTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SymbolTickerModelCopyWith<SymbolTickerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymbolTickerModelCopyWith<$Res> {
  factory $SymbolTickerModelCopyWith(
    SymbolTickerModel value,
    $Res Function(SymbolTickerModel) then,
  ) = _$SymbolTickerModelCopyWithImpl<$Res, SymbolTickerModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'e') String eventType,
    @JsonKey(name: 'E') int eventTime,
    @JsonKey(name: 's') String symbol,
    @JsonKey(name: 'p') String priceChange,
    @JsonKey(name: 'P') String priceChangePercent,
    @JsonKey(name: 'w') String weightedAvgPrice,
    @JsonKey(name: 'c') String lastPrice,
    @JsonKey(name: 'Q') String lastQty,
    @JsonKey(name: 'b') String bidPrice,
    @JsonKey(name: 'B') String bidQty,
    @JsonKey(name: 'a') String askPrice,
    @JsonKey(name: 'A') String askQty,
    @JsonKey(name: 'o') String openPrice,
    @JsonKey(name: 'h') String highPrice,
    @JsonKey(name: 'l') String lowPrice,
    @JsonKey(name: 'v') String volume,
    @JsonKey(name: 'q') String quoteVolume,
    @JsonKey(name: 'O') int openTime,
    @JsonKey(name: 'C') int closeTime,
    @JsonKey(name: 'F') int firstId,
    @JsonKey(name: 'L') int lastId,
    @JsonKey(name: 'n') int count,
  });
}

/// @nodoc
class _$SymbolTickerModelCopyWithImpl<$Res, $Val extends SymbolTickerModel>
    implements $SymbolTickerModelCopyWith<$Res> {
  _$SymbolTickerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SymbolTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? eventTime = null,
    Object? symbol = null,
    Object? priceChange = null,
    Object? priceChangePercent = null,
    Object? weightedAvgPrice = null,
    Object? lastPrice = null,
    Object? lastQty = null,
    Object? bidPrice = null,
    Object? bidQty = null,
    Object? askPrice = null,
    Object? askQty = null,
    Object? openPrice = null,
    Object? highPrice = null,
    Object? lowPrice = null,
    Object? volume = null,
    Object? quoteVolume = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? firstId = null,
    Object? lastId = null,
    Object? count = null,
  }) {
    return _then(
      _value.copyWith(
            eventType: null == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String,
            eventTime: null == eventTime
                ? _value.eventTime
                : eventTime // ignore: cast_nullable_to_non_nullable
                      as int,
            symbol: null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                      as String,
            priceChange: null == priceChange
                ? _value.priceChange
                : priceChange // ignore: cast_nullable_to_non_nullable
                      as String,
            priceChangePercent: null == priceChangePercent
                ? _value.priceChangePercent
                : priceChangePercent // ignore: cast_nullable_to_non_nullable
                      as String,
            weightedAvgPrice: null == weightedAvgPrice
                ? _value.weightedAvgPrice
                : weightedAvgPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            lastPrice: null == lastPrice
                ? _value.lastPrice
                : lastPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            lastQty: null == lastQty
                ? _value.lastQty
                : lastQty // ignore: cast_nullable_to_non_nullable
                      as String,
            bidPrice: null == bidPrice
                ? _value.bidPrice
                : bidPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            bidQty: null == bidQty
                ? _value.bidQty
                : bidQty // ignore: cast_nullable_to_non_nullable
                      as String,
            askPrice: null == askPrice
                ? _value.askPrice
                : askPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            askQty: null == askQty
                ? _value.askQty
                : askQty // ignore: cast_nullable_to_non_nullable
                      as String,
            openPrice: null == openPrice
                ? _value.openPrice
                : openPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            highPrice: null == highPrice
                ? _value.highPrice
                : highPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            lowPrice: null == lowPrice
                ? _value.lowPrice
                : lowPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            volume: null == volume
                ? _value.volume
                : volume // ignore: cast_nullable_to_non_nullable
                      as String,
            quoteVolume: null == quoteVolume
                ? _value.quoteVolume
                : quoteVolume // ignore: cast_nullable_to_non_nullable
                      as String,
            openTime: null == openTime
                ? _value.openTime
                : openTime // ignore: cast_nullable_to_non_nullable
                      as int,
            closeTime: null == closeTime
                ? _value.closeTime
                : closeTime // ignore: cast_nullable_to_non_nullable
                      as int,
            firstId: null == firstId
                ? _value.firstId
                : firstId // ignore: cast_nullable_to_non_nullable
                      as int,
            lastId: null == lastId
                ? _value.lastId
                : lastId // ignore: cast_nullable_to_non_nullable
                      as int,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SymbolTickerModelImplCopyWith<$Res>
    implements $SymbolTickerModelCopyWith<$Res> {
  factory _$$SymbolTickerModelImplCopyWith(
    _$SymbolTickerModelImpl value,
    $Res Function(_$SymbolTickerModelImpl) then,
  ) = __$$SymbolTickerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'e') String eventType,
    @JsonKey(name: 'E') int eventTime,
    @JsonKey(name: 's') String symbol,
    @JsonKey(name: 'p') String priceChange,
    @JsonKey(name: 'P') String priceChangePercent,
    @JsonKey(name: 'w') String weightedAvgPrice,
    @JsonKey(name: 'c') String lastPrice,
    @JsonKey(name: 'Q') String lastQty,
    @JsonKey(name: 'b') String bidPrice,
    @JsonKey(name: 'B') String bidQty,
    @JsonKey(name: 'a') String askPrice,
    @JsonKey(name: 'A') String askQty,
    @JsonKey(name: 'o') String openPrice,
    @JsonKey(name: 'h') String highPrice,
    @JsonKey(name: 'l') String lowPrice,
    @JsonKey(name: 'v') String volume,
    @JsonKey(name: 'q') String quoteVolume,
    @JsonKey(name: 'O') int openTime,
    @JsonKey(name: 'C') int closeTime,
    @JsonKey(name: 'F') int firstId,
    @JsonKey(name: 'L') int lastId,
    @JsonKey(name: 'n') int count,
  });
}

/// @nodoc
class __$$SymbolTickerModelImplCopyWithImpl<$Res>
    extends _$SymbolTickerModelCopyWithImpl<$Res, _$SymbolTickerModelImpl>
    implements _$$SymbolTickerModelImplCopyWith<$Res> {
  __$$SymbolTickerModelImplCopyWithImpl(
    _$SymbolTickerModelImpl _value,
    $Res Function(_$SymbolTickerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SymbolTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? eventTime = null,
    Object? symbol = null,
    Object? priceChange = null,
    Object? priceChangePercent = null,
    Object? weightedAvgPrice = null,
    Object? lastPrice = null,
    Object? lastQty = null,
    Object? bidPrice = null,
    Object? bidQty = null,
    Object? askPrice = null,
    Object? askQty = null,
    Object? openPrice = null,
    Object? highPrice = null,
    Object? lowPrice = null,
    Object? volume = null,
    Object? quoteVolume = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? firstId = null,
    Object? lastId = null,
    Object? count = null,
  }) {
    return _then(
      _$SymbolTickerModelImpl(
        eventType: null == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String,
        eventTime: null == eventTime
            ? _value.eventTime
            : eventTime // ignore: cast_nullable_to_non_nullable
                  as int,
        symbol: null == symbol
            ? _value.symbol
            : symbol // ignore: cast_nullable_to_non_nullable
                  as String,
        priceChange: null == priceChange
            ? _value.priceChange
            : priceChange // ignore: cast_nullable_to_non_nullable
                  as String,
        priceChangePercent: null == priceChangePercent
            ? _value.priceChangePercent
            : priceChangePercent // ignore: cast_nullable_to_non_nullable
                  as String,
        weightedAvgPrice: null == weightedAvgPrice
            ? _value.weightedAvgPrice
            : weightedAvgPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        lastPrice: null == lastPrice
            ? _value.lastPrice
            : lastPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        lastQty: null == lastQty
            ? _value.lastQty
            : lastQty // ignore: cast_nullable_to_non_nullable
                  as String,
        bidPrice: null == bidPrice
            ? _value.bidPrice
            : bidPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        bidQty: null == bidQty
            ? _value.bidQty
            : bidQty // ignore: cast_nullable_to_non_nullable
                  as String,
        askPrice: null == askPrice
            ? _value.askPrice
            : askPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        askQty: null == askQty
            ? _value.askQty
            : askQty // ignore: cast_nullable_to_non_nullable
                  as String,
        openPrice: null == openPrice
            ? _value.openPrice
            : openPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        highPrice: null == highPrice
            ? _value.highPrice
            : highPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        lowPrice: null == lowPrice
            ? _value.lowPrice
            : lowPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        volume: null == volume
            ? _value.volume
            : volume // ignore: cast_nullable_to_non_nullable
                  as String,
        quoteVolume: null == quoteVolume
            ? _value.quoteVolume
            : quoteVolume // ignore: cast_nullable_to_non_nullable
                  as String,
        openTime: null == openTime
            ? _value.openTime
            : openTime // ignore: cast_nullable_to_non_nullable
                  as int,
        closeTime: null == closeTime
            ? _value.closeTime
            : closeTime // ignore: cast_nullable_to_non_nullable
                  as int,
        firstId: null == firstId
            ? _value.firstId
            : firstId // ignore: cast_nullable_to_non_nullable
                  as int,
        lastId: null == lastId
            ? _value.lastId
            : lastId // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SymbolTickerModelImpl extends _SymbolTickerModel {
  const _$SymbolTickerModelImpl({
    @JsonKey(name: 'e') required this.eventType,
    @JsonKey(name: 'E') required this.eventTime,
    @JsonKey(name: 's') required this.symbol,
    @JsonKey(name: 'p') required this.priceChange,
    @JsonKey(name: 'P') required this.priceChangePercent,
    @JsonKey(name: 'w') required this.weightedAvgPrice,
    @JsonKey(name: 'c') required this.lastPrice,
    @JsonKey(name: 'Q') required this.lastQty,
    @JsonKey(name: 'b') required this.bidPrice,
    @JsonKey(name: 'B') required this.bidQty,
    @JsonKey(name: 'a') required this.askPrice,
    @JsonKey(name: 'A') required this.askQty,
    @JsonKey(name: 'o') required this.openPrice,
    @JsonKey(name: 'h') required this.highPrice,
    @JsonKey(name: 'l') required this.lowPrice,
    @JsonKey(name: 'v') required this.volume,
    @JsonKey(name: 'q') required this.quoteVolume,
    @JsonKey(name: 'O') required this.openTime,
    @JsonKey(name: 'C') required this.closeTime,
    @JsonKey(name: 'F') required this.firstId,
    @JsonKey(name: 'L') required this.lastId,
    @JsonKey(name: 'n') required this.count,
  }) : super._();

  factory _$SymbolTickerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SymbolTickerModelImplFromJson(json);

  @override
  @JsonKey(name: 'e')
  final String eventType;
  @override
  @JsonKey(name: 'E')
  final int eventTime;
  @override
  @JsonKey(name: 's')
  final String symbol;
  @override
  @JsonKey(name: 'p')
  final String priceChange;
  @override
  @JsonKey(name: 'P')
  final String priceChangePercent;
  @override
  @JsonKey(name: 'w')
  final String weightedAvgPrice;
  @override
  @JsonKey(name: 'c')
  final String lastPrice;
  @override
  @JsonKey(name: 'Q')
  final String lastQty;
  @override
  @JsonKey(name: 'b')
  final String bidPrice;
  //extra
  @override
  @JsonKey(name: 'B')
  final String bidQty;
  @override
  @JsonKey(name: 'a')
  final String askPrice;
  //extra
  @override
  @JsonKey(name: 'A')
  final String askQty;
  @override
  @JsonKey(name: 'o')
  final String openPrice;
  @override
  @JsonKey(name: 'h')
  final String highPrice;
  @override
  @JsonKey(name: 'l')
  final String lowPrice;
  @override
  @JsonKey(name: 'v')
  final String volume;
  @override
  @JsonKey(name: 'q')
  final String quoteVolume;
  @override
  @JsonKey(name: 'O')
  final int openTime;
  @override
  @JsonKey(name: 'C')
  final int closeTime;
  @override
  @JsonKey(name: 'F')
  final int firstId;
  @override
  @JsonKey(name: 'L')
  final int lastId;
  @override
  @JsonKey(name: 'n')
  final int count;

  @override
  String toString() {
    return 'SymbolTickerModel(eventType: $eventType, eventTime: $eventTime, symbol: $symbol, priceChange: $priceChange, priceChangePercent: $priceChangePercent, weightedAvgPrice: $weightedAvgPrice, lastPrice: $lastPrice, lastQty: $lastQty, bidPrice: $bidPrice, bidQty: $bidQty, askPrice: $askPrice, askQty: $askQty, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, volume: $volume, quoteVolume: $quoteVolume, openTime: $openTime, closeTime: $closeTime, firstId: $firstId, lastId: $lastId, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymbolTickerModelImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.priceChange, priceChange) ||
                other.priceChange == priceChange) &&
            (identical(other.priceChangePercent, priceChangePercent) ||
                other.priceChangePercent == priceChangePercent) &&
            (identical(other.weightedAvgPrice, weightedAvgPrice) ||
                other.weightedAvgPrice == weightedAvgPrice) &&
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.lastQty, lastQty) || other.lastQty == lastQty) &&
            (identical(other.bidPrice, bidPrice) ||
                other.bidPrice == bidPrice) &&
            (identical(other.bidQty, bidQty) || other.bidQty == bidQty) &&
            (identical(other.askPrice, askPrice) ||
                other.askPrice == askPrice) &&
            (identical(other.askQty, askQty) || other.askQty == askQty) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice) &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.quoteVolume, quoteVolume) ||
                other.quoteVolume == quoteVolume) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.firstId, firstId) || other.firstId == firstId) &&
            (identical(other.lastId, lastId) || other.lastId == lastId) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    eventType,
    eventTime,
    symbol,
    priceChange,
    priceChangePercent,
    weightedAvgPrice,
    lastPrice,
    lastQty,
    bidPrice,
    bidQty,
    askPrice,
    askQty,
    openPrice,
    highPrice,
    lowPrice,
    volume,
    quoteVolume,
    openTime,
    closeTime,
    firstId,
    lastId,
    count,
  ]);

  /// Create a copy of SymbolTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SymbolTickerModelImplCopyWith<_$SymbolTickerModelImpl> get copyWith =>
      __$$SymbolTickerModelImplCopyWithImpl<_$SymbolTickerModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SymbolTickerModelImplToJson(this);
  }
}

abstract class _SymbolTickerModel extends SymbolTickerModel {
  const factory _SymbolTickerModel({
    @JsonKey(name: 'e') required final String eventType,
    @JsonKey(name: 'E') required final int eventTime,
    @JsonKey(name: 's') required final String symbol,
    @JsonKey(name: 'p') required final String priceChange,
    @JsonKey(name: 'P') required final String priceChangePercent,
    @JsonKey(name: 'w') required final String weightedAvgPrice,
    @JsonKey(name: 'c') required final String lastPrice,
    @JsonKey(name: 'Q') required final String lastQty,
    @JsonKey(name: 'b') required final String bidPrice,
    @JsonKey(name: 'B') required final String bidQty,
    @JsonKey(name: 'a') required final String askPrice,
    @JsonKey(name: 'A') required final String askQty,
    @JsonKey(name: 'o') required final String openPrice,
    @JsonKey(name: 'h') required final String highPrice,
    @JsonKey(name: 'l') required final String lowPrice,
    @JsonKey(name: 'v') required final String volume,
    @JsonKey(name: 'q') required final String quoteVolume,
    @JsonKey(name: 'O') required final int openTime,
    @JsonKey(name: 'C') required final int closeTime,
    @JsonKey(name: 'F') required final int firstId,
    @JsonKey(name: 'L') required final int lastId,
    @JsonKey(name: 'n') required final int count,
  }) = _$SymbolTickerModelImpl;
  const _SymbolTickerModel._() : super._();

  factory _SymbolTickerModel.fromJson(Map<String, dynamic> json) =
      _$SymbolTickerModelImpl.fromJson;

  @override
  @JsonKey(name: 'e')
  String get eventType;
  @override
  @JsonKey(name: 'E')
  int get eventTime;
  @override
  @JsonKey(name: 's')
  String get symbol;
  @override
  @JsonKey(name: 'p')
  String get priceChange;
  @override
  @JsonKey(name: 'P')
  String get priceChangePercent;
  @override
  @JsonKey(name: 'w')
  String get weightedAvgPrice;
  @override
  @JsonKey(name: 'c')
  String get lastPrice;
  @override
  @JsonKey(name: 'Q')
  String get lastQty;
  @override
  @JsonKey(name: 'b')
  String get bidPrice; //extra
  @override
  @JsonKey(name: 'B')
  String get bidQty;
  @override
  @JsonKey(name: 'a')
  String get askPrice; //extra
  @override
  @JsonKey(name: 'A')
  String get askQty;
  @override
  @JsonKey(name: 'o')
  String get openPrice;
  @override
  @JsonKey(name: 'h')
  String get highPrice;
  @override
  @JsonKey(name: 'l')
  String get lowPrice;
  @override
  @JsonKey(name: 'v')
  String get volume;
  @override
  @JsonKey(name: 'q')
  String get quoteVolume;
  @override
  @JsonKey(name: 'O')
  int get openTime;
  @override
  @JsonKey(name: 'C')
  int get closeTime;
  @override
  @JsonKey(name: 'F')
  int get firstId;
  @override
  @JsonKey(name: 'L')
  int get lastId;
  @override
  @JsonKey(name: 'n')
  int get count;

  /// Create a copy of SymbolTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SymbolTickerModelImplCopyWith<_$SymbolTickerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
