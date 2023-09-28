import 'package:flutter/material.dart';
import 'package:meals_app/data/categories.dart';
import 'package:meals_app/widget/category/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const routeName = "/categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 4 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20),
                children: categoriesSample
                    .map((category) => CategoryItem(
                        id: category.id,
                        title: category.title,
                        color: category.color))
                    .toList())));
  }
}
