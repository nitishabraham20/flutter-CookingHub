import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_ingredient/providers/favorites_provider.dart';
import 'package:food_ingredient/models/meal.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoritesProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favoritesProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(isAdded
                    ? 'Meal marked as favorite'
                    : 'Meal removed from favorites'),
                duration: const Duration(seconds: 1),
              ));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                key: ValueKey(isFavorite),
              ),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
