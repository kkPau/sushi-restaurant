import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: '21.00',
      imagePath: 'assets/images/sushi.png',
      rating: '4.9',
      description:
          'Indulge in the sublime flavors of salmon sushi, a culinary delight that\'s sure to tantalize your taste buds. Each piece features the finest, buttery salmon, expertly paired with perfectly seasoned vinegared rice, resulting in a harmonious blend of savory and refreshing notes. The vibrant orange-pink hue of the salmon contrasts beautifully with the pristine white rice, creating a visually appealing masterpiece. With every bite, you\'ll experience the delicate richness and oceanic freshness of the salmon, making it a delightful treat for sushi enthusiasts and newcomers alike.',
    ),
    Food(
      name: "Salmon Sticks",
      price: '25.00',
      imagePath: 'assets/images/salmon_stick.png',
      rating: '4.7',
      description:
          'Dive into the delectable world of salmon sticks, a delightful culinary creation that\'s bound to satisfy your cravings. These delectable morsels feature succulent salmon, carefully crafted into stick form. With each bite, you\'ll experience the irresistible combination of tender salmon and a subtle hint of the ocean\'s freshness. The simplicity of salmon sticks allows the natural flavors to shine, making them a mouthwatering choice for seafood lovers. Whether enjoyed as an appetizer or a main course, these savory treats are a testament to the pure, unadulterated pleasure of quality salmon.',
    ),
    Food(
      name: "Tuna",
      price: '30.00',
      imagePath: 'assets/images/tuna.png',
      rating: '4.3',
      description:
          'Explore the culinary allure of tuna, a taste sensation that\'s bound to captivate your palate. Our tuna dishes showcase the essence of freshness and flavor, with succulent tuna as the star ingredient. Whether seared to perfection, thinly sliced for sashimi, or tucked into a roll, our tuna creations offer a harmonious blend of meaty texture and a delicate, oceanic taste. Each bite delivers a delightful symphony of savory goodness, making tuna a must-try for seafood enthusiasts. Come savor the pure, unadulterated pleasure of top-quality tuna at its finest.',
    ),
    Food(
      name: "Tuna Rolls",
      price: '28.00',
      imagePath: 'assets/images/drum_salmon.png',
      rating: '4.5',
      description:
          'Indulge in the exquisite world of tuna rolls, a culinary delight that promises a symphony of flavors and textures. These rolls are a testament to the art of sushi craftsmanship, featuring velvety slices of premium tuna nestled within a tender embrace of vinegared rice and wrapped in nori seaweed. Each bite is a harmonious blend of the rich, meaty goodness of tuna and the subtle sweetness of perfectly seasoned rice.The vibrant red hue of the tuna contrasts beautifully with the deep green of the nori, creating an inviting visual feast. Paired with a touch of wasabi and a dip in soy sauce, every bite offers a tantalizing burst of umami, satisfying both the palate and the soul.',
    ),
  ];

  double _total = 0.00;

  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      _total += double.parse(foodItem.price);

      notifyListeners();
    }
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    _total -= double.parse(food.price);

    notifyListeners();
  }

  double get totatAmount => _total;
}
