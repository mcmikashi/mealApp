import 'package:flutter/material.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/widget/meal/meal_item.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});
  static const routeName = "/category_detail";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routeArgs['id'];
    final String? categoryTitle = routeArgs['title'];
    final categoryMeals = mealsSample.where((meal) {
      return meal.categories.contains(categoryId);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        backgroundColor: Theme.of(context).primaryColorLight,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var meal = categoryMeals.elementAt(index);
          return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
