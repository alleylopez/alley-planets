import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlanetScreen extends ConsumerWidget {
  final Planet planet;
  const PlanetScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: '1-${planet.name}', child: Text(planet.name)),
      ),
      body: Center(child: Text(planet.description)),
    );
  }
}
