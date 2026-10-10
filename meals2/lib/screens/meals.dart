import 'package:flutter/material.dart';
import 'package:meals2/models/meal.dart';
import 'package:meals2/screens/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final Widget content = meals.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Uh oh ... nothing here!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Try selecting a different category!',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) => MealItem(meal: meals[index]),
          );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
