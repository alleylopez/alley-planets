import 'package:alley_planets/core/utils/app_logger.dart';
import 'package:alley_planets/features/planets/presentation/pages/planet_page.dart';
import 'package:alley_planets/features/planets/presentation/screens/home_screen.dart';
import 'package:alley_planets/features/planets/presentation/screens/planet_screen.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/planets',
        builder: (context, state) => const PlanetPageScreen(),
      ),
      GoRoute(
        path: '/planets/:name',
        builder: (context, state) {
          final planetName = state.pathParameters['name']!;
          final planet = ref
              .watch(planetFilterControllerProvider)
              .value
              ?.getPlanetByName(planetName);
          AppLogger.log('Planet name in  route: $planetName');
          if (planet == null) {
            return Scaffold(
              appBar: AppBar(
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      GoRouter.of(context).go('/planets');
                    },
                  ),
                ),
                title: const Text('Get back to view the planets'),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Planet not found',
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Error 404',
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return PlanetScreen(planet: planet);
        },
      ),
    ],
  );
});
