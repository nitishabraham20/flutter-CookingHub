import 'package:flutter/material.dart';

import 'package:food_ingredient/models/meal.dart';
import 'package:food_ingredient/screens/meal_details.dart';
import 'package:food_ingredient/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealDetailsScreen(
        meal: meal,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh... No food item to display',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Please select a different category!',
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) =>
              MealItem(meals[index], onSelectMeal: _selectMeal));
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
