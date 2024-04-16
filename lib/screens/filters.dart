import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_ingredient/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filters',
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filter.glutenFree]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isSwitched);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.lactoseFree]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isSwitched);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!,
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.vegetarian]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isSwitched);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.vegan]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isSwitched);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
