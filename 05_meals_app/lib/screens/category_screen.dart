import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatefulWidget {
  final List<MealModel> availableMeals;
  const CategoryScreen({super.key, required this.availableMeals});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0, // default
      upperBound: 1, // default
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => SlideTransition(
        position: Tween(
          // between two
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(_animationController),
        // position: _animationController.drive(
        //   Tween(
        //     begin: const Offset(0, 0.3),
        //     end: const Offset(0, 0),
        //   ),
        // ),
        child: child,
      ),
      // => Padding(
      //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
      //   child: child,
      // ),
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final data in dummyCategoryData)
            CategoryGridItem(
              categoryModel: data,
              availableMeals: widget.availableMeals,
            )
        ],
      ),
    );
  }
}
