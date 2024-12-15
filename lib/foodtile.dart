// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sushi_restaurant/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? onTap;
  FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 20),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Image.asset(
              food.imagePath,
              height: 150,
            ),
            const SizedBox(height: 10),
            Text(
              food.name,
              style:
                  const TextStyle(fontFamily: 'DMSerifDisplay', fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${food.price}'),
                const SizedBox(width: 20),
                Icon(
                  Icons.star,
                  color: Colors.yellow[800],
                ),
                Text(
                  food.rating,
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
