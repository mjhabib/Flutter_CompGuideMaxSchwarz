import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal_model.dart';

class FavoritesNotifier extends StateNotifier<List<MealModel>> {
  FavoritesNotifier() : super([]);

  bool toggleFavoriteMeals(MealModel mealModel) {
    final mealIsFavorite = state.contains(mealModel);
    // in this StateNotifier we are not allowed to use methods like 'add' or 'remove' to manipulate a list/map/..., instead we have to always assign new values to that list
    if (mealIsFavorite) {
      // the 'state' is a global property in this notifier
      state = state.where((m) => m.id != mealModel.id).toList();
      return false;
    } else {
      // we use spread operator to re-assign new meals to old list of meals!
      state = [...state, mealModel];
      return true;
      // we return true or false here for items that are removed or added so we can show a relevant message later on in meal_details_screen
    }
  }
}

final favoritesNotifier =
    StateNotifierProvider<FavoritesNotifier, List<MealModel>>((ref) {
  return FavoritesNotifier();
});
