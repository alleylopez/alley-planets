import 'package:alley_planets/features/planets/domain/entities/planet.dart';

abstract class PlanetRepository {
  Future<List<Planet>> getPlanets();
}
