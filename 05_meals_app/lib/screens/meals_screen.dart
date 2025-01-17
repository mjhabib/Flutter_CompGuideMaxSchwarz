import 'package:flutter/material.dart';

import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<MealModel> mealModel;
  const MealsScreen({
    super.key,
    this.title,
    required this.mealModel,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: mealModel.length,
      itemBuilder: (context, index) {
        return MealItem(
          mealModel: mealModel[index],
        );
      },
    );

    if (mealModel.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh Oh... there is nothing here!',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
