import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters=ref.watch(filtersProvider);
    return
       Scaffold(
        appBar: AppBar(
          title: const Text('Your Favourites'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value:activeFilters[Filters.glutenFree]! ,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, isChecked);
                },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, isChecked);
                },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Lactose free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, isChecked);
              },
              title: Text(
                'Vegatarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegatarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegan]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.vegan, isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ]
        )
    );
  }
}