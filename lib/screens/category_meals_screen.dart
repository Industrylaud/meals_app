import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals =
        DUMMY_MEALS.where((x) => x.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = categoryMeals[index];

          return MealItem(
            affordability: item.affordability,
            complexity: item.complexity,
            duration: item.duration,
            imageUrl: item.imageUrl,
            title: item.title,
            id: item.id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
