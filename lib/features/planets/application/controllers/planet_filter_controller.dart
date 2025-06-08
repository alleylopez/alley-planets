import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alley_planets/features/planets/application/providers/planet_repository_provider.dart';
import '../../domain/entities/planet.dart';

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
    state = state.whenData(
      (dynamic s) => (s is PlanetFilterState) ? s.copyWith(name: name) : s,
    );
  }

  void setAtmosphere(List<String> atmosphere) {
    state = state.whenData(
      (dynamic s) =>
          (s is PlanetFilterState) ? s.copyWith(atmosphere: atmosphere) : s,
    );
  }

  void setMinVolume(double? min) {
    state = state.whenData(
      (dynamic s) => (s is PlanetFilterState) ? s.copyWith(minVolume: min) : s,
    );
  }

  void setMaxVolume(double? max) {
    state = state.whenData(
      (dynamic s) => (s is PlanetFilterState) ? s.copyWith(maxVolume: max) : s,
    );
  }

  List<Planet> get filteredPlanets {
    final s = state.value;
    if (s == null) return [];
    return s.planets.where((planet) {
      final matchesName =
          s.name.isEmpty ||
          planet.name.toLowerCase().contains(s.name.toLowerCase());
      final matchesAtmosphere =
          s.atmosphere.isEmpty ||
          s.atmosphere.every((a) => planet.atmosphereComposition.contains(a));
      final matchesMinVolume =
          s.minVolume == null || planet.volumeKm3 >= s.minVolume!;
      final matchesMaxVolume =
          s.maxVolume == null || planet.volumeKm3 <= s.maxVolume!;
      return matchesName &&
          matchesAtmosphere &&
          matchesMinVolume &&
          matchesMaxVolume;
    }).toList();
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
          atmosphere.every((a) => planet.atmosphereComposition.contains(a));
      final matchesMinVolume =
          minVolume == null || planet.volumeKm3 >= (minVolume ?? 0);
      final matchesMaxVolume =
          maxVolume == null ||
          planet.volumeKm3 <= (maxVolume ?? double.infinity);
      return matchesName &&
          matchesAtmosphere &&
          matchesMinVolume &&
          matchesMaxVolume;
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
