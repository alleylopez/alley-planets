import 'package:alley_planets/features/planets/domain/entities/planet.dart';
import 'package:alley_planets/features/planets/presentation/widgets/glowing_button.dart';
import 'package:alley_planets/features/planets/presentation/widgets/planet_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../widgets/planet_filter_bar.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_filter_controller.dart';

class PlanetsScreen extends ConsumerWidget {
  const PlanetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterStateAsync = ref.watch(planetFilterControllerProvider);
    final state = filterStateAsync.asData?.value;
    final filteredPlanets = state?.getFilteredPlanets() ?? [];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            PlanetFilterBar(),
            Expanded(child: PlanetPageView(planets: filteredPlanets)),
          ],
        ),
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(() {
        setState(() {});
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
                child: Hero(
                  tag: 'planet-1-${planet.name}',
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
          ),
          // Planet Info at top
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: '1-${planet.name}',
                  child: Text(
                    planet.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Glowing TextButton
                GlowingButton(
                  text: 'View Details',
                  onPressed: () =>
                      context.go('/planets/${planet.name.toLowerCase()}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
