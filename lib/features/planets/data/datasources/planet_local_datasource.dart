import 'package:alley_planets/core/domain/entities/planet.dart';
import 'package:alley_planets/core/legacy-code/app_logger.dart';
import 'package:alley_planets/core/utils/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class PlanetLocalDatasource {
  PlanetLocalDatasource(this._firestore);

  final FirebaseFirestore _firestore;

  Future<Either<Failure, List<Planet>>> getPlanets() async {
    AppLogger.log('Getting planets from Firestore');
    try {
      final doc = await _firestore
          .collection('solar-system')
          .doc('solar_system_doc')
          .get();

      final data = doc.data();
      AppLogger.log('Planets retrieved from Firestore');

      if (data == null) {
        AppLogger.log('No planets document found in Firestore');
        return left(
          const FirebaseNotFoundFailure(
            message: 'Documento de sistema solar no encontrado.',
          ),
        );
      }

      final rawPlanets = data['solar_system'];
      if (rawPlanets is! List) {
        AppLogger.log('Field solar_system is not a list');
        return left(
          const FirebaseUnknownFailure(
            message: 'Estructura inesperada para solar_system.',
            code: 'invalid-structure',
          ),
        );
      }

      final planetsData = rawPlanets
          .whereType<Map<String, dynamic>>()
          .toList(growable: false);
      final planets = planetsData.map(Planet.fromJson).toList();

      AppLogger.log(
        'Successfully retrieved ${planets.length} planets from Firestore',
      );
      return right(planets);
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.log('Firebase error getting planets: ${e.code} - ${e.message}');
      AppLogger.log(stackTrace.toString());
      return left(
        FirebaseFailure.fromCode(
          e.code,
          message: e.message ?? 'Error de Firebase al obtener planetas.',
        ),
      );
    } catch (e, stackTrace) {
      AppLogger.log('Unexpected error getting planets: $e');
      AppLogger.log(stackTrace.toString());
      return left(
        FirebaseFailure.fromCode(
          'unknown',
          message: 'Error inesperado al obtener planetas.',
        ),
      );
    }
  }
}
