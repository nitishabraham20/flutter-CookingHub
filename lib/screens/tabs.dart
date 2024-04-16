import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_ingredient/providers/favorites_provider.dart';
import 'package:food_ingredient/providers/filters_provider.dart';
import 'package:food_ingredient/screens/categories.dart';
import 'package:food_ingredient/screens/filters.dart';
import 'package:food_ingredient/screens/meals.dart';
import 'package:food_ingredient/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _tabIndex = 0;

  void _onSelectTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);

    Widget activeScreen = CategoriesScreen(
      availableMeals: filteredMeals,
    );

    var navigationTitleText = 'Pick your category';

    if (_tabIndex == 1) {
      final favoriteMeals = ref.watch(favoritesProvider);
      activeScreen = MealsScreen(
        meals: favoriteMeals,
      );
      navigationTitleText = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(navigationTitleText),
      ),
      body: activeScreen,
      drawer: MainDrawer(
        onTileSelected: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectTab,
        currentIndex: _tabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
