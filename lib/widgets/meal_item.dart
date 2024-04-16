import 'package:flutter/material.dart';

import 'package:food_ingredient/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:food_ingredient/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(this.meal, {super.key, required this.onSelectMeal});

  final Meal meal;

  final void Function(BuildContext context, Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectMeal(context, meal);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: affordabilityText),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
