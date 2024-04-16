import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_ingredient/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      // state.remove(meal);
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // state.add(meal);
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
