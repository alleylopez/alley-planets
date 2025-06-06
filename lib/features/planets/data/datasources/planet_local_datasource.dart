import 'package:alley_planets/core/utils/app_logger.dart';
import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
# Used to create the collection in firebase with hash reference
String _generateHash(List<Planet> planets) {
  final combined = planets.map((p) => p.toJson().toString()).join();
  return combined.hashCode.toString();
}
*/

class PlanetLocalDatasource {
  final FirebaseFirestore _firestore;
  PlanetLocalDatasource(this._firestore);

  Future<List<Planet>> getPlanets() async {
    AppLogger.log('Getting planets from Firestore'); // Log start
    try {
      final doc = await _firestore
          .collection('solar-system')
          .doc('solar_system_doc')
          .get();

      final data = doc.data();
      AppLogger.log("Planets retrieved from Firestore"); // Log retrieved data

      if (data == null || data['solar_system'] == null) {
        AppLogger.log('No planets found in Firestore'); // Log if no planets
        return [];
      }

      final planetsData = List<Map<String, dynamic>>.from(data['solar_system']);
      final planets = planetsData.map(Planet.fromJson).toList();
      AppLogger.log(
        'Successfully retrieved ${planets.length} planets from Firestore',
      ); // Log success
      return planets;
    } catch (e) {
      AppLogger.log('Error getting planets from Firestore: $e'); // Log error
      return []; // Return an empty list in case of error
    }
  }
}
