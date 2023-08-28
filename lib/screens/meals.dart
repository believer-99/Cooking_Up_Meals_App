import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meal});
  final String? title;
  final List<Meal> meal;
  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(context, meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, index) => MealItem(
              meal: meal[index],
              onSelectMeal: (meal) => selectMeal(meal, context),
            ));
    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh Oh!...Nothing here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try Selecting a different Category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    if(title==null)
    {
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
