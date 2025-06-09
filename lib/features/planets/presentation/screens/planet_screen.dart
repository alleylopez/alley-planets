import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlanetScreen extends ConsumerWidget {
  final Planet planet;
  const PlanetScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/planets');
          },
        ),
        title: Hero(tag: '1-${planet.name}', child: Text(planet.name)),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Hero(
                tag: 'planet-1-${planet.name}',
                child: Image.asset(
                  'assets${planet.image}',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              Text(planet.description),
            ],
          ),
        ),
      ),
    );
  }
}
