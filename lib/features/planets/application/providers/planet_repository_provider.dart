import 'package:alley_planets/core/domain/repositories/planet_repository.dart';
import 'package:alley_planets/core/infrastructure/planet_firestore_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'planet_repository_provider.g.dart';

@Riverpod(keepAlive: true)
PlanetRepository planetRepository(Ref ref) {
  final local = PlanetFirestoreDatasource(FirebaseFirestore.instance);
  return PlanetRepositoryImpl(local: local);
}
