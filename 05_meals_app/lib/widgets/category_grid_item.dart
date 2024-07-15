import 'package:flutter/material.dart';

import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final void Function(MealModel meal) onToggleFavorites;
  final List<MealModel> availableMeals;
  const CategoryGridItem(
      {super.key,
      required this.categoryModel,
      required this.onToggleFavorites,
      required this.availableMeals});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealsScreen(
                onToggleFavorites: onToggleFavorites,
                title: categoryModel.title,
                mealModel: availableMeals
                    .where((meal) => meal.categories.contains(categoryModel.id))
                    .toList()),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              categoryModel.color.withOpacity(0.5),
              categoryModel.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
