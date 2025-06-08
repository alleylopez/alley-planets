import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alley_planets/features/planets/application/providers/planet_repository_provider.dart';

part 'planet_filter_controller.g.dart';

// Use a single public PlanetFilterState for all state
@Riverpod(keepAlive: true)
class PlanetFilterController extends _$PlanetFilterController {
  @override
  FutureOr<PlanetFilterState> build() async {
    try {
      final repo = ref.read(planetRepositoryProvider);
      final planets = await repo.getPlanets();
      return PlanetFilterState(planets: planets);
    } catch (e) {
      return PlanetFilterState(loading: false, error: e.toString());
    }
  }

  void setName(String name) {
    state = state.whenData((data) => data.copyWith(name: name));
  }

  void setAtmosphere(List<String> atmosphere) {
    state = state.whenData((data) => data.copyWith(atmosphere: atmosphere));
  }

  void setMinVolume(double? min) {
    state = state.whenData((data) => data.copyWith(minVolume: min));
  }

  void setMaxVolume(double? max) {
    state = state.whenData((data) => data.copyWith(maxVolume: max));
  }

  void resetFilters() {
    state = state.whenData((data) {
      // Create a new state with default filter values,
      // but keep the loaded planets, loading status, and error status.
      return PlanetFilterState(
        planets: data.planets, // Keep the original list of all planets
        name: '', // Default
        atmosphere: [], // Default
        minVolume: null, // Default
        maxVolume: null, // Default
        loading: data.loading, // Preserve loading state
        error: data.error, // Preserve error state
      );
    });
  }
}

class PlanetFilterState {
  final List<Planet> planets;
  final String name;
  final List<String> atmosphere;
  final double? minVolume;
  final double? maxVolume;
  final bool loading;
  final String? error;

  const PlanetFilterState({
    this.planets = const [],
    this.name = '',
    this.atmosphere = const [],
    this.minVolume,
    this.maxVolume,
    this.loading = false,
    this.error,
  });

  PlanetFilterState copyWith({
    List<Planet>? planets,
    String? name,
    List<String>? atmosphere,
    double? minVolume,
    double? maxVolume,
    bool? loading,
    String? error,
  }) {
    return PlanetFilterState(
      planets: planets ?? this.planets,
      name: name ?? this.name,
      atmosphere: atmosphere ?? this.atmosphere,
      minVolume: minVolume ?? this.minVolume,
      maxVolume: maxVolume ?? this.maxVolume,
      loading: loading ?? this.loading,
      error: error,
    );
  }

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

      final matchesVolume =
          (minVolume == null || planet.volumeKm3 >= minVolume!) &&
          (maxVolume == null || planet.volumeKm3 <= maxVolume!);

      return matchesName && matchesAtmosphere && matchesVolume;
    }).toList();
  }

  Planet getPlanetByName(String name) {
    return planets.firstWhere(
      (p) => p.name.toLowerCase() == name.toLowerCase(),
      orElse: () => Planet(
        name: '',
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
        image: '',
        description: '',
      ),
    );
  }
}
