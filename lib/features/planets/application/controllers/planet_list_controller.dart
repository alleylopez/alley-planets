import 'package:alley_planets/core/utils/app_logger.dart';
import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alley_planets/features/planets/application/providers/planet_repository_provider.dart';

part 'planet_list_controller.g.dart';

@riverpod
class PlanetListController extends _$PlanetListController {
  @override
  Future<List<Planet>> build() async {
    final repo = ref.read(planetRepositoryProvider);
    AppLogger.log('Getting planets from repository provider');
    return await repo.getPlanets();
  }
}
