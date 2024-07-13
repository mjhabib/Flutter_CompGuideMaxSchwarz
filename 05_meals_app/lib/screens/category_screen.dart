import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  final void Function(MealModel meal) onToggleFavorites;
  const CategoryScreen({super.key, required this.onToggleFavorites});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        //   dummyCategoryData.map((data) => CategoryGridItem(categoryModel: data)).toList()
        for (final data in dummyCategoryData)
          CategoryGridItem(
            categoryModel: data,
            onToggleFavorites: onToggleFavorites,
          )
      ],
    );
  }
}
