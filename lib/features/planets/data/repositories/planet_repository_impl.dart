import 'package:alley_planets/features/planets/data/datasources/planet_local_datasource.dart';
import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:alley_planets/features/planets/facade/planet_repository.dart';

class PlanetRepositoryImpl implements PlanetRepository {
  
  final PlanetLocalDatasource local;
  PlanetRepositoryImpl({required this.local});

  @override
  Future<List<Planet>> getPlanets() async {
    final planets = await local.getPlanets();
    if (planets.isNotEmpty) {
      return planets;
    }
    return [];
  }
}
