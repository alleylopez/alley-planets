import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alley_planets/features/planets/application/providers/planet_repository_provider.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_filter_state.dart';

part 'planet_filter_controller.g.dart';

@Riverpod(keepAlive: true)
class PlanetFilterController extends _$PlanetFilterController {
  @override
  FutureOr<PlanetFilterState> build() async {
    try {
      final repo = ref.read(planetRepositoryProvider);
      final planets = await repo.getPlanets();
      return PlanetFilterState(
        planets: planets,
        minVolume: PlanetFilterState.minAvailableVolume,
        maxVolume: PlanetFilterState.maxAvailableVolume,
      );
    } catch (e) {
      return PlanetFilterState(
        loading: false,
        error: e.toString(),
        minVolume: PlanetFilterState.minAvailableVolume,
        maxVolume: PlanetFilterState.maxAvailableVolume,
      );
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
    state = state.whenData(
      (data) => data.copyWith(
        name: '',
        atmosphere: [],
        minVolume: PlanetFilterState.minAvailableVolume,
        maxVolume: PlanetFilterState.maxAvailableVolume,
      ),
    );
  }
}
