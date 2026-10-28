import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals2/data/dummy_data.dart';
import 'package:meals2/models/meal.dart';

final mealsProvider = Provider<List<Meal>>((ref) => dummyMeals);
