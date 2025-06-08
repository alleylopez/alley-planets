import 'package:alley_planets/features/planets/data/datasources/planet_local_datasource.dart';
import 'package:alley_planets/features/planets/data/repositories/planet_repository_impl.dart';
import 'package:alley_planets/features/planets/facade/planet_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'planet_repository_provider.g.dart';

@Riverpod(keepAlive: true)
PlanetRepository planetRepository(Ref ref) {
  final local = PlanetLocalDatasource(FirebaseFirestore.instance);
  return PlanetRepositoryImpl(local: local);
}

