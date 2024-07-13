import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:meals_app/models/meal_model.dart';

class MealItem extends StatelessWidget {
  final MealModel mealModel;
  const MealItem({super.key, required this.mealModel});

  // Uppercase the first letter using a getter then concatenate it to the rest of the string
  String get complexityText {
    return mealModel.complexity.name[0].toUpperCase() +
        mealModel.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealModel.affordability.name[0].toUpperCase() +
        mealModel.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealDetailsScreen(
                      mealModel: mealModel,
                    )),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealModel.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black45,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      mealModel.title,
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${mealModel.duration} min',
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
