import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealInfoItem extends StatelessWidget {
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealInfoItem({this.duration, this.complexity, this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(Icons.schedule),
            SizedBox(width: 6),
            Text('$duration min')
          ],
        ),
        Row(
          children: [
            Icon(Icons.work),
            SizedBox(width: 6),
            Text(complexityText),
          ],
        ),
        Row(
          children: [
            Icon(Icons.monetization_on_rounded),
            SizedBox(width: 6),
            Text(affordabilityText),
          ],
        ),
      ],
    );
  }
}
