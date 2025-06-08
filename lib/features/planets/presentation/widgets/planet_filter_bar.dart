import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_filter_controller.dart';

class PlanetPageFilterBar extends ConsumerStatefulWidget {
  const PlanetPageFilterBar({super.key});

  @override
  ConsumerState<PlanetPageFilterBar> createState() =>
      _PlanetPageFilterBarState();
}

class _PlanetPageFilterBarState extends ConsumerState<PlanetPageFilterBar> {
  bool _showFilters = false;
  late TextEditingController _searchNameController;

  // Hardcoded atmosphere options
  final List<String> _atmosphereOptions = const [
    'Oxygen',
    'Sodium',
    'Hydrogen',
    'Helium',
    'Potassium',
    'Carbon Dioxide',
    'Nitrogen',
    'Argon',
    'Methane',
  ];

  // Hardcoded volume range (based on JSON)
  static const double _minVolume = 6.0e10;
  static const double _maxVolume = 1.5e15;

  @override
  void initState() {
    super.initState();
    // Initialize with the current name from the filter, if available.
    // Reading initial state like this is okay for initState.
    final initialName = ref.read(planetFilterControllerProvider).value?.name ?? '';
    _searchNameController = TextEditingController(text: initialName);
  }

  @override
  void dispose() {
    _searchNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(planetFilterControllerProvider);
    final notifier = ref.read(planetFilterControllerProvider.notifier);

    final currentMin = (filter.value?.minVolume ?? _minVolume).clamp(_minVolume, _maxVolume);
    final currentMax = (filter.value?.maxVolume ?? _maxVolume).clamp(_minVolume, _maxVolume);

    // Sync TextField with external changes to filter name (e.g., if filters are reset)
    final currentFilterName = filter.value?.name ?? '';
    if (_searchNameController.text != currentFilterName) {
      // Use a post-frame callback to safely update the controller after the build.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _searchNameController.text != currentFilterName) {
          _searchNameController.text = currentFilterName;
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Filters'),
            actions: [
              IconButton(
                icon: Icon(_showFilters ? Icons.close : Icons.filter_list),
                onPressed: () => setState(() => _showFilters = !_showFilters),
              ),
            ],
          ),
          if (_showFilters)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _searchNameController,
                  decoration: const InputDecoration(labelText: 'Search by name'),
                  onChanged: notifier.setName, // This will trigger a rebuild
                ),
                const SizedBox(height: 12),
                Text('Atmosphere Components'),
                Wrap(
                  spacing: 8,
                  children: _atmosphereOptions.map((option) {
                    // 'selected' here is bool? because filter.value might be null
                    final bool? selected = filter.value?.atmosphere.contains(option);
                    return FilterChip(
                      label: Text(option),
                      // Provide a default value (false) if selected is null
                      selected: selected ?? false,
                      onSelected: (_) {
                        // Safely access atmosphere from filter.value, defaulting to an empty list if null
                        final List<String> currentAtmosphere = filter.value?.atmosphere ?? const [];
                        final List<String> updatedAtmosphere = List<String>.from(currentAtmosphere);
                        // Explicitly check for true to handle null case for 'selected'
                        (selected == true) ? updatedAtmosphere.remove(option) : updatedAtmosphere.add(option);
                        notifier.setAtmosphere(updatedAtmosphere);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text('Volume Range'),
                RangeSlider(
                  min: _minVolume,
                  max: _maxVolume,
                  divisions: 100,
                  values: RangeValues(currentMin, currentMax),
                  labels: RangeLabels(
                    currentMin.toStringAsExponential(2),
                    currentMax.toStringAsExponential(2),
                  ),
                  onChanged: (range) {
                    notifier.setMinVolume(range.start);
                    notifier.setMaxVolume(range.end);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Min: ${_minVolume.toStringAsExponential(2)}'),
                    Text('Max: ${_maxVolume.toStringAsExponential(2)}'),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: notifier.resetFilters,
                    child: const Text('Reset Filters'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
