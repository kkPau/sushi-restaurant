import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:sushi_restaurant/button.dart';
import 'package:sushi_restaurant/cartpage.dart';
import 'package:sushi_restaurant/fooddetails.dart';
import 'package:sushi_restaurant/foodtile.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFood(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.of(context).push(PageTransition(
      child: FoodDetails(food: foodMenu[index]),
      type: PageTransitionType.topToBottom,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    ));
  }

  void nav() {
    Navigator.of(context).push(PageTransition(
      child: FoodDetails(
          food: Food(
              name: 'Salmon Eggs',
              price: '21.00',
              imagePath: 'assets/images/salmon_eggs.png',
              rating: '4.8',
              description:
                  'Explore the exquisite world of salmon eggs, where culinary sophistication meets the vibrant flavors of the sea. These tiny, glistening orbs, also known as ikura in Japanese, are a treasure trove of taste. With each delicate pop in your mouth, you\'ll be immersed in the essence of the ocean.Salmon eggs are a true delicacy, known for their luscious, briny flavor and luxurious texture. Served atop sushi, sashimi, or as a garnish, their brilliant orange hue adds a touch of elegance to any dish. Each individual pearl bursts with a rich, complex taste that dances between salty and slightly sweet, creating a harmonious melody of flavors.')),
      type: PageTransitionType.topToBottom,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        centerTitle: true,
        title: const Text(
          'Tokyo',
          style: TextStyle(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: const CartPage(),
                    type: PageTransitionType.bottomToTop,
                    duration: const Duration(seconds: 1),
                    reverseDuration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey[900],
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 138, 60, 55),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Get 32% Promo',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(text: 'Redeem', onTap: () {})
                  ],
                ),
                Image.asset(
                  'assets/images/manysalmon.png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                  hintText: 'Search here...',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white))),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[800]),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) {
                  return FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToFood(index),
                  );
                }),
          ),
          GestureDetector(
            onTap: () => nav(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.symmetric(horizontal: 25)
                  .copyWith(bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/salmon_eggs.png',
                        height: 60,
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salmon Eggs',
                            style: TextStyle(
                                fontFamily: 'DMSerifDisplay', fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Text('\$21.00'),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
