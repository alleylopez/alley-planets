import 'package:alley_planets/core/domain/entities/planet.dart';
import 'package:alley_planets/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PlanetRepository {
  Future<Either<Failure, List<Planet>>> getPlanets();
}
