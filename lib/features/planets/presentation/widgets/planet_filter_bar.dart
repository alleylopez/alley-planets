import 'package:alley_planets/features/planets/application/controllers/planet_filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alley_planets/features/planets/application/controllers/planet_filter_controller.dart';

class PlanetFilterBar extends ConsumerStatefulWidget {
  const PlanetFilterBar({super.key});
  @override
  ConsumerState<PlanetFilterBar> createState() => _PlanetFilterBarState();
}

class _PlanetFilterBarState extends ConsumerState<PlanetFilterBar> {
  bool _showFilters = false;
  late TextEditingController _searchNameController;

  @override
  void initState() {
    super.initState();
    final initialName =
        ref.read(planetFilterControllerProvider).value?.name ?? '';
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

    final currentMin =
        (filter.value?.minVolume ?? PlanetFilterState.minAvailableVolume).clamp(
          PlanetFilterState.minAvailableVolume,
          PlanetFilterState.maxAvailableVolume,
        );

    final currentMax =
        (filter.value?.maxVolume ?? PlanetFilterState.maxAvailableVolume).clamp(
          PlanetFilterState.minAvailableVolume,
          PlanetFilterState.maxAvailableVolume,
        );

    final currentFilterName = filter.value?.name ?? '';
    if (_searchNameController.text != currentFilterName) {
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
                  decoration: const InputDecoration(
                    labelText: 'Search by name',
                  ),
                  onChanged: notifier.setName,
                ),
                const SizedBox(height: 12),
                Text('Atmosphere Components'),
                Wrap(
                  spacing: 8,
                  children: PlanetFilterState.atmosphereOptions.map((option) {
                    final selected =
                        filter.value?.atmosphere.contains(option) ?? false;
                    return FilterChip(
                      label: Text(option),
                      selected: selected,
                      onSelected: (_) {
                        final currentAtmosphere =
                            filter.value?.atmosphere ?? const [];
                        final updatedAtmosphere = List<String>.from(
                          currentAtmosphere,
                        );

                        selected
                            ? updatedAtmosphere.remove(option)
                            : updatedAtmosphere.add(option);

                        notifier.setAtmosphere(updatedAtmosphere);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text('Volume Range'),
                RangeSlider(
                  min: PlanetFilterState.minAvailableVolume,
                  max: PlanetFilterState.maxAvailableVolume,
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
                    Text(
                      'Min: ${PlanetFilterState.minAvailableVolume.toStringAsExponential(2)}',
                    ),
                    Text(
                      'Max: ${PlanetFilterState.maxAvailableVolume.toStringAsExponential(2)}',
                    ),
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
