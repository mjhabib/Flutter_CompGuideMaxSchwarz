import 'package:flutter/material.dart';

import 'package:meals_app/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryGridItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
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
    );
  }
}
