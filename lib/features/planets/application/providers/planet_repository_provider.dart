import 'package:alley_planets/features/planets/data/datasources/planet_local_datasource.dart';
import 'package:alley_planets/features/planets/data/repositories/planet_repository_impl.dart';
import 'package:alley_planets/features/planets/repositories/planet_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'planet_repository_provider.g.dart';

@riverpod
PlanetRepository planetRepository(ref) {
  final local = PlanetLocalDatasource(FirebaseFirestore.instance);
  return PlanetRepositoryImpl(local: local);
}
