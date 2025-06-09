import 'package:alley_planets/core/utils/app_logger.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_filter_controller.dart';
import 'package:alley_planets/features/planets/presentation/widgets/glowing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLogger.log('Welcome to the home screen and planets...');
    final filterStateAsync = ref.watch(planetFilterControllerProvider);
    final state = filterStateAsync.asData?.value;
    final filteredPlanets = state?.getFilteredPlanets() ?? [];
    return Scaffold(
      body: Center(
        child: GlowingButton(
          text: 'View Planets',
          onPressed: () {
            if (filteredPlanets.isNotEmpty) {
              context.go('/planets');
            }
          },
        ),
      ),
    );
  }
}
