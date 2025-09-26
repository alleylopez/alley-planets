import 'package:alley_planets/core/domain/entities/planet.dart';
import 'package:alley_planets/core/domain/repositories/planet_repository.dart';
import 'package:alley_planets/core/utils/failure.dart';
import 'package:alley_planets/features/planets/data/datasources/planet_local_datasource.dart';
import 'package:dartz/dartz.dart';

class PlanetRepositoryImpl implements PlanetRepository {
  PlanetRepositoryImpl({required this.local});

  final PlanetLocalDatasource local;

  @override
  Future<Either<Failure, List<Planet>>> getPlanets() {
    return local.getPlanets();
  }
}
