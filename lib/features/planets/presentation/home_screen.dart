import 'package:alley_planets/core/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_list_controller.dart';
import 'package:alley_planets/features/planets/domain/entities/planet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planets = ref.watch(planetListControllerProvider);
    AppLogger.log('Building home screen and planets...');
    return Scaffold(
      body: planets.when(
        data: (planets) => PlanetPageView(planets: planets),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class PlanetPageView extends StatefulWidget {
  final List<Planet> planets;
  const PlanetPageView({super.key, required this.planets});
  @override
  State<PlanetPageView> createState() => _PlanetPageViewState();
}

class _PlanetPageViewState extends State<PlanetPageView> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(() {
        setState(() {
          _currentPage = _pageController.page ?? 0;
        });
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.planets.length,
      itemBuilder: (context, index) {
        final planet = widget.planets[index]; // Adjust for more/less movement
        return PlanetPage(planet: planet);
      },
    );
  }
}

class PlanetPage extends StatelessWidget {
  final Planet planet;

  const PlanetPage({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Background color behind everything
      child: Stack(
        children: [
          // Half planet image at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.6, // Shows bottom half of the image
                child: Image.asset(
                  'assets${planet.image}',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.7,
                  //height: MediaQuery.of(context).size.height * 0.7,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Colors.black),
                ),
              ),
            ),
          ),
          // Planet Info at top
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  planet.name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    planet.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
