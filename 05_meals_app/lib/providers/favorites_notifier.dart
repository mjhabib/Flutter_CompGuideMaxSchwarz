import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal_model.dart';

class FavoritesNotifier extends StateNotifier<List<MealModel>> {
  FavoritesNotifier() : super([]);

  bool toggleFavoriteMeals(MealModel mealModel) {
    final mealIsFavorite = state.contains(mealModel);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != mealModel.id).toList();
      return false;
    } else {
      state = [...state, mealModel];
      return true;
    }
  }
}

final favoritesNotifier =
    StateNotifierProvider<FavoritesNotifier, List<MealModel>>((ref) {
  return FavoritesNotifier();
});
