// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planet_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PlanetFilterState {
  List<Planet> get planets => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get atmosphere => throw _privateConstructorUsedError;
  double? get minVolume => throw _privateConstructorUsedError;
  double? get maxVolume => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of PlanetFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanetFilterStateCopyWith<PlanetFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetFilterStateCopyWith<$Res> {
  factory $PlanetFilterStateCopyWith(
    PlanetFilterState value,
    $Res Function(PlanetFilterState) then,
  ) = _$PlanetFilterStateCopyWithImpl<$Res, PlanetFilterState>;
  @useResult
  $Res call({
    List<Planet> planets,
    String name,
    List<String> atmosphere,
    double? minVolume,
    double? maxVolume,
    bool loading,
    String? error,
  });
}

/// @nodoc
class _$PlanetFilterStateCopyWithImpl<$Res, $Val extends PlanetFilterState>
    implements $PlanetFilterStateCopyWith<$Res> {
  _$PlanetFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanetFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planets = null,
    Object? name = null,
    Object? atmosphere = null,
    Object? minVolume = freezed,
    Object? maxVolume = freezed,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            planets: null == planets
                ? _value.planets
                : planets // ignore: cast_nullable_to_non_nullable
                      as List<Planet>,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            atmosphere: null == atmosphere
                ? _value.atmosphere
                : atmosphere // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            minVolume: freezed == minVolume
                ? _value.minVolume
                : minVolume // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxVolume: freezed == maxVolume
                ? _value.maxVolume
                : maxVolume // ignore: cast_nullable_to_non_nullable
                      as double?,
            loading: null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanetFilterStateImplCopyWith<$Res>
    implements $PlanetFilterStateCopyWith<$Res> {
  factory _$$PlanetFilterStateImplCopyWith(
    _$PlanetFilterStateImpl value,
    $Res Function(_$PlanetFilterStateImpl) then,
  ) = __$$PlanetFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Planet> planets,
    String name,
    List<String> atmosphere,
    double? minVolume,
    double? maxVolume,
    bool loading,
    String? error,
  });
}

/// @nodoc
class __$$PlanetFilterStateImplCopyWithImpl<$Res>
    extends _$PlanetFilterStateCopyWithImpl<$Res, _$PlanetFilterStateImpl>
    implements _$$PlanetFilterStateImplCopyWith<$Res> {
  __$$PlanetFilterStateImplCopyWithImpl(
    _$PlanetFilterStateImpl _value,
    $Res Function(_$PlanetFilterStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanetFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planets = null,
    Object? name = null,
    Object? atmosphere = null,
    Object? minVolume = freezed,
    Object? maxVolume = freezed,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$PlanetFilterStateImpl(
        planets: null == planets
            ? _value._planets
            : planets // ignore: cast_nullable_to_non_nullable
                  as List<Planet>,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        atmosphere: null == atmosphere
            ? _value._atmosphere
            : atmosphere // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        minVolume: freezed == minVolume
            ? _value.minVolume
            : minVolume // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxVolume: freezed == maxVolume
            ? _value.maxVolume
            : maxVolume // ignore: cast_nullable_to_non_nullable
                  as double?,
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$PlanetFilterStateImpl extends _PlanetFilterState {
  const _$PlanetFilterStateImpl({
    final List<Planet> planets = const [],
    this.name = '',
    final List<String> atmosphere = const [],
    this.minVolume,
    this.maxVolume,
    this.loading = false,
    this.error,
  }) : _planets = planets,
       _atmosphere = atmosphere,
       super._();

  final List<Planet> _planets;
  @override
  @JsonKey()
  List<Planet> get planets {
    if (_planets is EqualUnmodifiableListView) return _planets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_planets);
  }

  @override
  @JsonKey()
  final String name;
  final List<String> _atmosphere;
  @override
  @JsonKey()
  List<String> get atmosphere {
    if (_atmosphere is EqualUnmodifiableListView) return _atmosphere;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_atmosphere);
  }

  @override
  final double? minVolume;
  @override
  final double? maxVolume;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'PlanetFilterState(planets: $planets, name: $name, atmosphere: $atmosphere, minVolume: $minVolume, maxVolume: $maxVolume, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetFilterStateImpl &&
            const DeepCollectionEquality().equals(other._planets, _planets) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._atmosphere,
              _atmosphere,
            ) &&
            (identical(other.minVolume, minVolume) ||
                other.minVolume == minVolume) &&
            (identical(other.maxVolume, maxVolume) ||
                other.maxVolume == maxVolume) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_planets),
    name,
    const DeepCollectionEquality().hash(_atmosphere),
    minVolume,
    maxVolume,
    loading,
    error,
  );

  /// Create a copy of PlanetFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanetFilterStateImplCopyWith<_$PlanetFilterStateImpl> get copyWith =>
      __$$PlanetFilterStateImplCopyWithImpl<_$PlanetFilterStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PlanetFilterState extends PlanetFilterState {
  const factory _PlanetFilterState({
    final List<Planet> planets,
    final String name,
    final List<String> atmosphere,
    final double? minVolume,
    final double? maxVolume,
    final bool loading,
    final String? error,
  }) = _$PlanetFilterStateImpl;
  const _PlanetFilterState._() : super._();

  @override
  List<Planet> get planets;
  @override
  String get name;
  @override
  List<String> get atmosphere;
  @override
  double? get minVolume;
  @override
  double? get maxVolume;
  @override
  bool get loading;
  @override
  String? get error;

  /// Create a copy of PlanetFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanetFilterStateImplCopyWith<_$PlanetFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
