import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';


class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  
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
    final screenSize = MediaQuery.of(context).size;
    
    return Center(
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () {
            onSelectMeal(meal);
          },
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.14,
                    vertical: screenSize.height * 0.02,
                  ),
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(icon: Icons.schedule, label: '${meal.duration}min'),
                          const SizedBox(width: 12),
                          MealItemTrait(icon: Icons.work, label: complexityText),
                          const SizedBox(width: 12),
                          MealItemTrait(icon: Icons.attach_money, label: affordabilityText),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

