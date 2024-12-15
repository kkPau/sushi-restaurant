import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/button.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Food food) {
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 138, 60, 55),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 138, 60, 55),
          elevation: 0,
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String price = food.price;

                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(212, 135, 81, 77),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        price,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: GestureDetector(
                          onTap: () => removeFromCart(context, food),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(bottom: 20),
              child: Row(
                children: [
                  Expanded(child: MyButton(text: 'Pay Now', onTap: () {})),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(212, 135, 81, 77),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Total: \$${value.totatAmount}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
