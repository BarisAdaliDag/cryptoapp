// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mini_ticker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MiniTickerModel _$MiniTickerModelFromJson(Map<String, dynamic> json) {
  return _MiniTickerModel.fromJson(json);
}

/// @nodoc
mixin _$MiniTickerModel {
  @JsonKey(name: 'e')
  String get eventType => throw _privateConstructorUsedError;
  @JsonKey(name: 'E')
  int get eventTime => throw _privateConstructorUsedError;
  @JsonKey(name: 's')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'c')
  String get closePrice => throw _privateConstructorUsedError;
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

  /// Serializes this MiniTickerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MiniTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MiniTickerModelCopyWith<MiniTickerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiniTickerModelCopyWith<$Res> {
  factory $MiniTickerModelCopyWith(
    MiniTickerModel value,
    $Res Function(MiniTickerModel) then,
  ) = _$MiniTickerModelCopyWithImpl<$Res, MiniTickerModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'e') String eventType,
    @JsonKey(name: 'E') int eventTime,
    @JsonKey(name: 's') String symbol,
    @JsonKey(name: 'c') String closePrice,
    @JsonKey(name: 'o') String openPrice,
    @JsonKey(name: 'h') String highPrice,
    @JsonKey(name: 'l') String lowPrice,
    @JsonKey(name: 'v') String volume,
    @JsonKey(name: 'q') String quoteVolume,
  });
}

/// @nodoc
class _$MiniTickerModelCopyWithImpl<$Res, $Val extends MiniTickerModel>
    implements $MiniTickerModelCopyWith<$Res> {
  _$MiniTickerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MiniTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? eventTime = null,
    Object? symbol = null,
    Object? closePrice = null,
    Object? openPrice = null,
    Object? highPrice = null,
    Object? lowPrice = null,
    Object? volume = null,
    Object? quoteVolume = null,
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
            closePrice: null == closePrice
                ? _value.closePrice
                : closePrice // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MiniTickerModelImplCopyWith<$Res>
    implements $MiniTickerModelCopyWith<$Res> {
  factory _$$MiniTickerModelImplCopyWith(
    _$MiniTickerModelImpl value,
    $Res Function(_$MiniTickerModelImpl) then,
  ) = __$$MiniTickerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'e') String eventType,
    @JsonKey(name: 'E') int eventTime,
    @JsonKey(name: 's') String symbol,
    @JsonKey(name: 'c') String closePrice,
    @JsonKey(name: 'o') String openPrice,
    @JsonKey(name: 'h') String highPrice,
    @JsonKey(name: 'l') String lowPrice,
    @JsonKey(name: 'v') String volume,
    @JsonKey(name: 'q') String quoteVolume,
  });
}

/// @nodoc
class __$$MiniTickerModelImplCopyWithImpl<$Res>
    extends _$MiniTickerModelCopyWithImpl<$Res, _$MiniTickerModelImpl>
    implements _$$MiniTickerModelImplCopyWith<$Res> {
  __$$MiniTickerModelImplCopyWithImpl(
    _$MiniTickerModelImpl _value,
    $Res Function(_$MiniTickerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MiniTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? eventTime = null,
    Object? symbol = null,
    Object? closePrice = null,
    Object? openPrice = null,
    Object? highPrice = null,
    Object? lowPrice = null,
    Object? volume = null,
    Object? quoteVolume = null,
  }) {
    return _then(
      _$MiniTickerModelImpl(
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
        closePrice: null == closePrice
            ? _value.closePrice
            : closePrice // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MiniTickerModelImpl extends _MiniTickerModel {
  const _$MiniTickerModelImpl({
    @JsonKey(name: 'e') required this.eventType,
    @JsonKey(name: 'E') required this.eventTime,
    @JsonKey(name: 's') required this.symbol,
    @JsonKey(name: 'c') required this.closePrice,
    @JsonKey(name: 'o') required this.openPrice,
    @JsonKey(name: 'h') required this.highPrice,
    @JsonKey(name: 'l') required this.lowPrice,
    @JsonKey(name: 'v') required this.volume,
    @JsonKey(name: 'q') required this.quoteVolume,
  }) : super._();

  factory _$MiniTickerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MiniTickerModelImplFromJson(json);

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
  @JsonKey(name: 'c')
  final String closePrice;
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
  String toString() {
    return 'MiniTickerModel(eventType: $eventType, eventTime: $eventTime, symbol: $symbol, closePrice: $closePrice, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, volume: $volume, quoteVolume: $quoteVolume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MiniTickerModelImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.closePrice, closePrice) ||
                other.closePrice == closePrice) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice) &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.quoteVolume, quoteVolume) ||
                other.quoteVolume == quoteVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    eventType,
    eventTime,
    symbol,
    closePrice,
    openPrice,
    highPrice,
    lowPrice,
    volume,
    quoteVolume,
  );

  /// Create a copy of MiniTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MiniTickerModelImplCopyWith<_$MiniTickerModelImpl> get copyWith =>
      __$$MiniTickerModelImplCopyWithImpl<_$MiniTickerModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MiniTickerModelImplToJson(this);
  }
}

abstract class _MiniTickerModel extends MiniTickerModel {
  const factory _MiniTickerModel({
    @JsonKey(name: 'e') required final String eventType,
    @JsonKey(name: 'E') required final int eventTime,
    @JsonKey(name: 's') required final String symbol,
    @JsonKey(name: 'c') required final String closePrice,
    @JsonKey(name: 'o') required final String openPrice,
    @JsonKey(name: 'h') required final String highPrice,
    @JsonKey(name: 'l') required final String lowPrice,
    @JsonKey(name: 'v') required final String volume,
    @JsonKey(name: 'q') required final String quoteVolume,
  }) = _$MiniTickerModelImpl;
  const _MiniTickerModel._() : super._();

  factory _MiniTickerModel.fromJson(Map<String, dynamic> json) =
      _$MiniTickerModelImpl.fromJson;

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
  @JsonKey(name: 'c')
  String get closePrice;
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

  /// Create a copy of MiniTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MiniTickerModelImplCopyWith<_$MiniTickerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
