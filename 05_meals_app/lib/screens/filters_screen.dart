import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_notifier.dart';
// import 'package:meals_app/screens/tabs_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

// enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends ConsumerWidget {
  // this currentFilters variable will help us to save the status of any selected filters in filters_screen so when we push/pop to another screen, we don't lose the status of those filters
  // final Map<Filter, bool> currentFilters;
  const FiltersScreen({
    super.key,
    // required this.currentFilters,
  });

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   // we can't have access to the 'widget' here so we need to an initializer like 'initState' below
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activeFilters = ref.read(filtersNotifier);
  //   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
  //   _veganFilterSet = activeFilters[Filter.vegan]!;

  //   _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  //   _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // With 'push' we can go back and forth to our stack of screens if we use the physical back button on our device, but 'pushReplacement' will close the app if it can't find any other screens
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      // body: PopScope(
      //   // canPop: false,
      //   canPop: true,
      //   onPopInvoked: (didPop) {
      //     if (!didPop) return;
      //     // if (didPop) return;
      //     ref.read(filtersNotifier.notifier).setAllFilters({
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactoseFree: _lactoseFreeFilterSet,
      //       Filter.vegetarian: _vegetarianFilterSet,
      //       Filter.vegan: _veganFilterSet
      //     });
      // Navigator.of(context).pop({
      // Filter.glutenFree: _glutenFreeFilterSet,
      // Filter.lactoseFree: _lactoseFreeFilterSet,
      // Filter.vegetarian: _vegetarianFilterSet,
      // Filter.vegan: _veganFilterSet
      // });
      // },
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            // value: _glutenFreeFilterSet,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifier.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
              // setState(() {
              //   _glutenFreeFilterSet = isChecked;
              // });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            // value: _lactoseFreeFilterSet,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifier.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
              // setState(() {
              //   _lactoseFreeFilterSet = isChecked;
              // });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            // value: _vegetarianFilterSet,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifier.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
              // setState(() {
              //   _vegetarianFilterSet = isChecked;
              // });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            // value: _veganFilterSet,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifier.notifier)
                  .setFilter(Filter.vegan, isChecked);
              // setState(() {
              //   _veganFilterSet = isChecked;
              // });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
