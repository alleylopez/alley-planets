import 'package:alley_planets/core/domain/entities/planet.dart';
import 'package:alley_planets/core/infrastructure/planet_firestore_datasource.dart';
import 'package:alley_planets/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PlanetRepository {
  Future<Either<Failure, List<Planet>>> getPlanets();
}

class PlanetRepositoryImpl implements PlanetRepository {
  PlanetRepositoryImpl({required this.local});
  final PlanetFirestoreDatasource local;
  @override
  Future<Either<Failure, List<Planet>>> getPlanets() {
    return local.getPlanets();
  }
}
