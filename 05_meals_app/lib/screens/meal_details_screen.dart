import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  final String mealTitle;
  final String mealImage;
  const MealDetailsScreen(
      {super.key, required this.mealTitle, required this.mealImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mealTitle)),
      body: Image.network(
        mealImage,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
