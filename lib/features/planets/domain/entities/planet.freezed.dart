// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Planet _$PlanetFromJson(Map<String, dynamic> json) {
  return _Planet.fromJson(json);
}

/// @nodoc
mixin _$Planet {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'orbital_distance_km')
  int get orbitalDistanceKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'equatorial_radius_km')
  int get equatorialRadiusKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
  double get volumeKm3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'mass_kg', fromJson: parseScientificMass)
  double get massKg => throw _privateConstructorUsedError;
  @JsonKey(name: 'density_g_cm3')
  double get densityGCm3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'surface_gravity_m_s2')
  double get surfaceGravityMS2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'escape_velocity_kmh')
  int get escapeVelocityKmh => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_length_earth_days')
  double get dayLengthEarthDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
  double get yearLengthEarthDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'orbital_speed_kmh')
  int get orbitalSpeedKmh => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'atmosphere_composition',
    fromJson: _splitAtmosphere,
    toJson: _joinAtmosphere,
  )
  List<String> get atmosphereComposition => throw _privateConstructorUsedError;
  int get moons => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Planet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Planet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanetCopyWith<Planet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetCopyWith<$Res> {
  factory $PlanetCopyWith(Planet value, $Res Function(Planet) then) =
      _$PlanetCopyWithImpl<$Res, Planet>;
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'orbital_distance_km') int orbitalDistanceKm,
    @JsonKey(name: 'equatorial_radius_km') int equatorialRadiusKm,
    @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
    double volumeKm3,
    @JsonKey(name: 'mass_kg', fromJson: parseScientificMass) double massKg,
    @JsonKey(name: 'density_g_cm3') double densityGCm3,
    @JsonKey(name: 'surface_gravity_m_s2') double surfaceGravityMS2,
    @JsonKey(name: 'escape_velocity_kmh') int escapeVelocityKmh,
    @JsonKey(name: 'day_length_earth_days') double dayLengthEarthDays,
    @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
    double yearLengthEarthDays,
    @JsonKey(name: 'orbital_speed_kmh') int orbitalSpeedKmh,
    @JsonKey(
      name: 'atmosphere_composition',
      fromJson: _splitAtmosphere,
      toJson: _joinAtmosphere,
    )
    List<String> atmosphereComposition,
    int moons,
    String image,
    String description,
  });
}

/// @nodoc
class _$PlanetCopyWithImpl<$Res, $Val extends Planet>
    implements $PlanetCopyWith<$Res> {
  _$PlanetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Planet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? orbitalDistanceKm = null,
    Object? equatorialRadiusKm = null,
    Object? volumeKm3 = null,
    Object? massKg = null,
    Object? densityGCm3 = null,
    Object? surfaceGravityMS2 = null,
    Object? escapeVelocityKmh = null,
    Object? dayLengthEarthDays = null,
    Object? yearLengthEarthDays = null,
    Object? orbitalSpeedKmh = null,
    Object? atmosphereComposition = null,
    Object? moons = null,
    Object? image = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            orbitalDistanceKm: null == orbitalDistanceKm
                ? _value.orbitalDistanceKm
                : orbitalDistanceKm // ignore: cast_nullable_to_non_nullable
                      as int,
            equatorialRadiusKm: null == equatorialRadiusKm
                ? _value.equatorialRadiusKm
                : equatorialRadiusKm // ignore: cast_nullable_to_non_nullable
                      as int,
            volumeKm3: null == volumeKm3
                ? _value.volumeKm3
                : volumeKm3 // ignore: cast_nullable_to_non_nullable
                      as double,
            massKg: null == massKg
                ? _value.massKg
                : massKg // ignore: cast_nullable_to_non_nullable
                      as double,
            densityGCm3: null == densityGCm3
                ? _value.densityGCm3
                : densityGCm3 // ignore: cast_nullable_to_non_nullable
                      as double,
            surfaceGravityMS2: null == surfaceGravityMS2
                ? _value.surfaceGravityMS2
                : surfaceGravityMS2 // ignore: cast_nullable_to_non_nullable
                      as double,
            escapeVelocityKmh: null == escapeVelocityKmh
                ? _value.escapeVelocityKmh
                : escapeVelocityKmh // ignore: cast_nullable_to_non_nullable
                      as int,
            dayLengthEarthDays: null == dayLengthEarthDays
                ? _value.dayLengthEarthDays
                : dayLengthEarthDays // ignore: cast_nullable_to_non_nullable
                      as double,
            yearLengthEarthDays: null == yearLengthEarthDays
                ? _value.yearLengthEarthDays
                : yearLengthEarthDays // ignore: cast_nullable_to_non_nullable
                      as double,
            orbitalSpeedKmh: null == orbitalSpeedKmh
                ? _value.orbitalSpeedKmh
                : orbitalSpeedKmh // ignore: cast_nullable_to_non_nullable
                      as int,
            atmosphereComposition: null == atmosphereComposition
                ? _value.atmosphereComposition
                : atmosphereComposition // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            moons: null == moons
                ? _value.moons
                : moons // ignore: cast_nullable_to_non_nullable
                      as int,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanetImplCopyWith<$Res> implements $PlanetCopyWith<$Res> {
  factory _$$PlanetImplCopyWith(
    _$PlanetImpl value,
    $Res Function(_$PlanetImpl) then,
  ) = __$$PlanetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'orbital_distance_km') int orbitalDistanceKm,
    @JsonKey(name: 'equatorial_radius_km') int equatorialRadiusKm,
    @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
    double volumeKm3,
    @JsonKey(name: 'mass_kg', fromJson: parseScientificMass) double massKg,
    @JsonKey(name: 'density_g_cm3') double densityGCm3,
    @JsonKey(name: 'surface_gravity_m_s2') double surfaceGravityMS2,
    @JsonKey(name: 'escape_velocity_kmh') int escapeVelocityKmh,
    @JsonKey(name: 'day_length_earth_days') double dayLengthEarthDays,
    @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
    double yearLengthEarthDays,
    @JsonKey(name: 'orbital_speed_kmh') int orbitalSpeedKmh,
    @JsonKey(
      name: 'atmosphere_composition',
      fromJson: _splitAtmosphere,
      toJson: _joinAtmosphere,
    )
    List<String> atmosphereComposition,
    int moons,
    String image,
    String description,
  });
}

/// @nodoc
class __$$PlanetImplCopyWithImpl<$Res>
    extends _$PlanetCopyWithImpl<$Res, _$PlanetImpl>
    implements _$$PlanetImplCopyWith<$Res> {
  __$$PlanetImplCopyWithImpl(
    _$PlanetImpl _value,
    $Res Function(_$PlanetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Planet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? orbitalDistanceKm = null,
    Object? equatorialRadiusKm = null,
    Object? volumeKm3 = null,
    Object? massKg = null,
    Object? densityGCm3 = null,
    Object? surfaceGravityMS2 = null,
    Object? escapeVelocityKmh = null,
    Object? dayLengthEarthDays = null,
    Object? yearLengthEarthDays = null,
    Object? orbitalSpeedKmh = null,
    Object? atmosphereComposition = null,
    Object? moons = null,
    Object? image = null,
    Object? description = null,
  }) {
    return _then(
      _$PlanetImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        orbitalDistanceKm: null == orbitalDistanceKm
            ? _value.orbitalDistanceKm
            : orbitalDistanceKm // ignore: cast_nullable_to_non_nullable
                  as int,
        equatorialRadiusKm: null == equatorialRadiusKm
            ? _value.equatorialRadiusKm
            : equatorialRadiusKm // ignore: cast_nullable_to_non_nullable
                  as int,
        volumeKm3: null == volumeKm3
            ? _value.volumeKm3
            : volumeKm3 // ignore: cast_nullable_to_non_nullable
                  as double,
        massKg: null == massKg
            ? _value.massKg
            : massKg // ignore: cast_nullable_to_non_nullable
                  as double,
        densityGCm3: null == densityGCm3
            ? _value.densityGCm3
            : densityGCm3 // ignore: cast_nullable_to_non_nullable
                  as double,
        surfaceGravityMS2: null == surfaceGravityMS2
            ? _value.surfaceGravityMS2
            : surfaceGravityMS2 // ignore: cast_nullable_to_non_nullable
                  as double,
        escapeVelocityKmh: null == escapeVelocityKmh
            ? _value.escapeVelocityKmh
            : escapeVelocityKmh // ignore: cast_nullable_to_non_nullable
                  as int,
        dayLengthEarthDays: null == dayLengthEarthDays
            ? _value.dayLengthEarthDays
            : dayLengthEarthDays // ignore: cast_nullable_to_non_nullable
                  as double,
        yearLengthEarthDays: null == yearLengthEarthDays
            ? _value.yearLengthEarthDays
            : yearLengthEarthDays // ignore: cast_nullable_to_non_nullable
                  as double,
        orbitalSpeedKmh: null == orbitalSpeedKmh
            ? _value.orbitalSpeedKmh
            : orbitalSpeedKmh // ignore: cast_nullable_to_non_nullable
                  as int,
        atmosphereComposition: null == atmosphereComposition
            ? _value._atmosphereComposition
            : atmosphereComposition // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        moons: null == moons
            ? _value.moons
            : moons // ignore: cast_nullable_to_non_nullable
                  as int,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanetImpl implements _Planet {
  const _$PlanetImpl({
    required this.name,
    @JsonKey(name: 'orbital_distance_km') required this.orbitalDistanceKm,
    @JsonKey(name: 'equatorial_radius_km') required this.equatorialRadiusKm,
    @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
    required this.volumeKm3,
    @JsonKey(name: 'mass_kg', fromJson: parseScientificMass)
    required this.massKg,
    @JsonKey(name: 'density_g_cm3') required this.densityGCm3,
    @JsonKey(name: 'surface_gravity_m_s2') required this.surfaceGravityMS2,
    @JsonKey(name: 'escape_velocity_kmh') required this.escapeVelocityKmh,
    @JsonKey(name: 'day_length_earth_days') required this.dayLengthEarthDays,
    @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
    required this.yearLengthEarthDays,
    @JsonKey(name: 'orbital_speed_kmh') required this.orbitalSpeedKmh,
    @JsonKey(
      name: 'atmosphere_composition',
      fromJson: _splitAtmosphere,
      toJson: _joinAtmosphere,
    )
    required final List<String> atmosphereComposition,
    required this.moons,
    required this.image,
    required this.description,
  }) : _atmosphereComposition = atmosphereComposition;

  factory _$PlanetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanetImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'orbital_distance_km')
  final int orbitalDistanceKm;
  @override
  @JsonKey(name: 'equatorial_radius_km')
  final int equatorialRadiusKm;
  @override
  @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
  final double volumeKm3;
  @override
  @JsonKey(name: 'mass_kg', fromJson: parseScientificMass)
  final double massKg;
  @override
  @JsonKey(name: 'density_g_cm3')
  final double densityGCm3;
  @override
  @JsonKey(name: 'surface_gravity_m_s2')
  final double surfaceGravityMS2;
  @override
  @JsonKey(name: 'escape_velocity_kmh')
  final int escapeVelocityKmh;
  @override
  @JsonKey(name: 'day_length_earth_days')
  final double dayLengthEarthDays;
  @override
  @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
  final double yearLengthEarthDays;
  @override
  @JsonKey(name: 'orbital_speed_kmh')
  final int orbitalSpeedKmh;
  final List<String> _atmosphereComposition;
  @override
  @JsonKey(
    name: 'atmosphere_composition',
    fromJson: _splitAtmosphere,
    toJson: _joinAtmosphere,
  )
  List<String> get atmosphereComposition {
    if (_atmosphereComposition is EqualUnmodifiableListView)
      return _atmosphereComposition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_atmosphereComposition);
  }

  @override
  final int moons;
  @override
  final String image;
  @override
  final String description;

  @override
  String toString() {
    return 'Planet(name: $name, orbitalDistanceKm: $orbitalDistanceKm, equatorialRadiusKm: $equatorialRadiusKm, volumeKm3: $volumeKm3, massKg: $massKg, densityGCm3: $densityGCm3, surfaceGravityMS2: $surfaceGravityMS2, escapeVelocityKmh: $escapeVelocityKmh, dayLengthEarthDays: $dayLengthEarthDays, yearLengthEarthDays: $yearLengthEarthDays, orbitalSpeedKmh: $orbitalSpeedKmh, atmosphereComposition: $atmosphereComposition, moons: $moons, image: $image, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orbitalDistanceKm, orbitalDistanceKm) ||
                other.orbitalDistanceKm == orbitalDistanceKm) &&
            (identical(other.equatorialRadiusKm, equatorialRadiusKm) ||
                other.equatorialRadiusKm == equatorialRadiusKm) &&
            (identical(other.volumeKm3, volumeKm3) ||
                other.volumeKm3 == volumeKm3) &&
            (identical(other.massKg, massKg) || other.massKg == massKg) &&
            (identical(other.densityGCm3, densityGCm3) ||
                other.densityGCm3 == densityGCm3) &&
            (identical(other.surfaceGravityMS2, surfaceGravityMS2) ||
                other.surfaceGravityMS2 == surfaceGravityMS2) &&
            (identical(other.escapeVelocityKmh, escapeVelocityKmh) ||
                other.escapeVelocityKmh == escapeVelocityKmh) &&
            (identical(other.dayLengthEarthDays, dayLengthEarthDays) ||
                other.dayLengthEarthDays == dayLengthEarthDays) &&
            (identical(other.yearLengthEarthDays, yearLengthEarthDays) ||
                other.yearLengthEarthDays == yearLengthEarthDays) &&
            (identical(other.orbitalSpeedKmh, orbitalSpeedKmh) ||
                other.orbitalSpeedKmh == orbitalSpeedKmh) &&
            const DeepCollectionEquality().equals(
              other._atmosphereComposition,
              _atmosphereComposition,
            ) &&
            (identical(other.moons, moons) || other.moons == moons) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    orbitalDistanceKm,
    equatorialRadiusKm,
    volumeKm3,
    massKg,
    densityGCm3,
    surfaceGravityMS2,
    escapeVelocityKmh,
    dayLengthEarthDays,
    yearLengthEarthDays,
    orbitalSpeedKmh,
    const DeepCollectionEquality().hash(_atmosphereComposition),
    moons,
    image,
    description,
  );

  /// Create a copy of Planet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      __$$PlanetImplCopyWithImpl<_$PlanetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanetImplToJson(this);
  }
}

abstract class _Planet implements Planet {
  const factory _Planet({
    required final String name,
    @JsonKey(name: 'orbital_distance_km') required final int orbitalDistanceKm,
    @JsonKey(name: 'equatorial_radius_km')
    required final int equatorialRadiusKm,
    @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
    required final double volumeKm3,
    @JsonKey(name: 'mass_kg', fromJson: parseScientificMass)
    required final double massKg,
    @JsonKey(name: 'density_g_cm3') required final double densityGCm3,
    @JsonKey(name: 'surface_gravity_m_s2')
    required final double surfaceGravityMS2,
    @JsonKey(name: 'escape_velocity_kmh') required final int escapeVelocityKmh,
    @JsonKey(name: 'day_length_earth_days')
    required final double dayLengthEarthDays,
    @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
    required final double yearLengthEarthDays,
    @JsonKey(name: 'orbital_speed_kmh') required final int orbitalSpeedKmh,
    @JsonKey(
      name: 'atmosphere_composition',
      fromJson: _splitAtmosphere,
      toJson: _joinAtmosphere,
    )
    required final List<String> atmosphereComposition,
    required final int moons,
    required final String image,
    required final String description,
  }) = _$PlanetImpl;

  factory _Planet.fromJson(Map<String, dynamic> json) = _$PlanetImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'orbital_distance_km')
  int get orbitalDistanceKm;
  @override
  @JsonKey(name: 'equatorial_radius_km')
  int get equatorialRadiusKm;
  @override
  @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
  double get volumeKm3;
  @override
  @JsonKey(name: 'mass_kg', fromJson: parseScientificMass)
  double get massKg;
  @override
  @JsonKey(name: 'density_g_cm3')
  double get densityGCm3;
  @override
  @JsonKey(name: 'surface_gravity_m_s2')
  double get surfaceGravityMS2;
  @override
  @JsonKey(name: 'escape_velocity_kmh')
  int get escapeVelocityKmh;
  @override
  @JsonKey(name: 'day_length_earth_days')
  double get dayLengthEarthDays;
  @override
  @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
  double get yearLengthEarthDays;
  @override
  @JsonKey(name: 'orbital_speed_kmh')
  int get orbitalSpeedKmh;
  @override
  @JsonKey(
    name: 'atmosphere_composition',
    fromJson: _splitAtmosphere,
    toJson: _joinAtmosphere,
  )
  List<String> get atmosphereComposition;
  @override
  int get moons;
  @override
  String get image;
  @override
  String get description;

  /// Create a copy of Planet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
