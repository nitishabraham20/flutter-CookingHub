import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_ingredient/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
