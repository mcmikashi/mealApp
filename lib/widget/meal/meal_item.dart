import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'hard';
      default:
        return "Unknow";
    }
  }

  String get priceText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Low';
      case Affordability.pricey:
        return 'Medium';
      case Affordability.luxurious:
        return 'High';
      default:
        return "Unknow";
    }
  }

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.of(context)
          .pushNamed(MealDetails.routeName, arguments: id)
          .then((result) {
        if (result != null) {
          print(result);
        }
      });
    }

    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return SizedBox(
                      width: 200,
                      height: 200,
                      child: Center(
                          child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      )),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 4,
                    ),
                    Text("$duration min")
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.card_travel),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(complexityText)
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.monetization_on),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(complexityText)
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
