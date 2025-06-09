import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'planet_filter_state.freezed.dart';

@freezed
class PlanetFilterState with _$PlanetFilterState {
  const PlanetFilterState._(); // Needed for custom methods

  const factory PlanetFilterState({
    @Default([]) List<Planet> planets,
    @Default('') String name,
    @Default([]) List<String> atmosphere,
    double? minVolume,
    double? maxVolume,
    @Default(false) bool loading,
    String? error,
  }) = _PlanetFilterState;

  // Hardcoded constants (shared app-wide)
  static const List<String> atmosphereOptions = [
    'Oxygen',
    'Sodium',
    'Hydrogen',
    'Helium',
    'Potassium',
    'Carbon Dioxide',
    'Nitrogen',
    'Argon',
    'Methane',
  ];

  static const double minAvailableVolume = 0;
  static const double maxAvailableVolume = 2e20;

  // Filtering logic
  List<Planet> getFilteredPlanets() {
    return planets.where((planet) {
      final matchesName =
          name.isEmpty ||
          planet.name.toLowerCase().contains(name.toLowerCase());

      final matchesAtmosphere =
          atmosphere.isEmpty ||
          planet.atmosphereComposition.any(
            (planetComponent) => atmosphere.any(
              (filterComponent) =>
                  planetComponent.toLowerCase() ==
                  filterComponent.toLowerCase(),
            ),
          );

      final volume = planet.volumeKm3;
      final matchesVolume =
          volume >= PlanetFilterState.minAvailableVolume &&
          volume <= PlanetFilterState.maxAvailableVolume;

      return matchesName && matchesAtmosphere && matchesVolume;
    }).toList();
  }

  Planet getPlanetByName(String name) {
    return planets.firstWhere(
      (p) => p.name.toLowerCase() == name.toLowerCase(),
      orElse: () => Planet(
        name: 'Planet does not exist in this solar system',
        atmosphereComposition: [],
        volumeKm3: 0,
        orbitalDistanceKm: 0,
        equatorialRadiusKm: 0,
        massKg: 0,
        densityGCm3: 0,
        surfaceGravityMS2: 0,
        escapeVelocityKmh: 0,
        dayLengthEarthDays: 0,
        yearLengthEarthDays: 0,
        orbitalSpeedKmh: 0,
        moons: 0,
        image: '/planets/planet-error.png',
        description: '',
      ),
    );
  }
}
