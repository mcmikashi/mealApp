import 'package:flutter/material.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});
  static const routeName = "/meal_detail";

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        height: 200,
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.black)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    String mealID = ModalRoute.of(context)?.settings.arguments as String;
    var meal = mealsSample.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor: Theme.of(context).primaryColorLight,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 275,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle("Ingedients"),
          buildContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.orangeAccent,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
              itemCount: meal.ingredients.length,
            ),
          ),
          buildSectionTitle("Steps"),
          buildContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}')),
                  title: Text(meal.steps[index]),
                );
              },
              itemCount: meal.steps.length,
            ),
          )
        ]),
      ),
    );
  }
}
