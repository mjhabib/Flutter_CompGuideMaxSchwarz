import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/providers/favorites_notifier.dart';

class MealDetailsScreen extends ConsumerWidget {
  final MealModel mealModel;
  const MealDetailsScreen({
    super.key,
    required this.mealModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoritesNotifier);
    final isFavorite = favoriteMeals.contains(mealModel);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoritesNotifier.notifier)
                    .toggleFavoriteMeals(mealModel);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Meal added as favorite.'
                        : 'Favorite meal removed!'),
                  ),
                );
              },
              icon: AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 500,
                ),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    // turns: animation,
                    turns: Tween(begin: 0.9, end: 1.0)
                        .animate(animation), // less wild compare to the default
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                  // this key is required so our animation detects any changes inside the Icon widget
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Animate to...
            Hero(
              tag: mealModel.id,
              child: Image.network(
                mealModel.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in mealModel.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final step in mealModel.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
