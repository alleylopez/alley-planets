// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math';

part 'planet.freezed.dart';
part 'planet.g.dart';

/// Parses scientific notation strings like "330.104 x 10^18" into double.
/// This methods was uses to load the collection in firebase.
double parseScientificMass(dynamic value) {
  if (value is int) return value.toDouble();
  if (value is double) return value;
  if (value is String) {
    final parts = value.split('x');
    if (parts.length != 2) return double.tryParse(value) ?? 0.0;
    final base = double.tryParse(parts[0].trim()) ?? 0.0;
    final exponent =
        int.tryParse(parts[1].replaceAll(RegExp(r'[^0-9-]'), '')) ?? 0;
    return base * pow(10.0, exponent);
  }
  return 0.0;
}

List<String> _splitAtmosphere(String value) =>
    value.split(',').map((e) => e.trim()).toList();

String _joinAtmosphere(List<String> list) => list.join(', ');

@freezed
class Planet with _$Planet {
  const factory Planet({
    required String name,
    @JsonKey(name: 'orbital_distance_km') required int orbitalDistanceKm,
    @JsonKey(name: 'equatorial_radius_km') required int equatorialRadiusKm,
    @JsonKey(name: 'volume_km3', fromJson: parseScientificMass)
    required double volumeKm3,
    @JsonKey(name: 'mass_kg', fromJson: parseScientificMass)
    required double massKg,
    @JsonKey(name: 'density_g_cm3') required double densityGCm3,
    @JsonKey(name: 'surface_gravity_m_s2') required double surfaceGravityMS2,
    @JsonKey(name: 'escape_velocity_kmh') required int escapeVelocityKmh,
    @JsonKey(name: 'day_length_earth_days') required double dayLengthEarthDays,
    @JsonKey(name: 'year_length_earth_days', defaultValue: 0.0)
    required double yearLengthEarthDays,
    @JsonKey(name: 'orbital_speed_kmh') required int orbitalSpeedKmh,
    @JsonKey(
      name: 'atmosphere_composition',
      fromJson: _splitAtmosphere,
      toJson: _joinAtmosphere,
    )
    required List<String> atmosphereComposition,
    required int moons,
    required String image,
    required String description,
  }) = _Planet;

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);
}
