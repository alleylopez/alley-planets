import 'package:alley_planets/core/utils/app_logger.dart';
import 'package:alley_planets/features/planets/presentation/screens/planets_screen.dart';
import 'package:alley_planets/features/planets/presentation/screens/home_screen.dart';
import 'package:alley_planets/features/planets/presentation/screens/planet_screen.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_filter_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/planets',
        builder: (context, state) => const PlanetsScreen(),
      ),
      GoRoute(
        path: '/planets/:name',
        builder: (context, state) {
          final planetName = state.pathParameters['name']!;
          final planet = ref
              .watch(planetFilterControllerProvider)
              .value!
              .getPlanetByName(planetName); // no puede ser null
          AppLogger.log('Planet name in route: $planetName');
          return PlanetScreen(planet: planet);
        },
      ),
    ],
  );
});
