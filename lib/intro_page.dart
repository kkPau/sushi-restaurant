import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sushi_restaurant/button.dart';

import 'menupage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SUSHI MAN',
              style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  fontSize: 28,
                  color: Colors.white),
            ),
            const SizedBox(height: 40),
            Image.asset('assets/images/salmon_eggs.png'),
            const SizedBox(height: 50),
            const Text(
              'THE TASTE OF JAPANESE FOOD',
              style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  fontSize: 40,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style: TextStyle(
                  color: Color.fromARGB(255, 219, 210, 210), height: 2),
            ),
            const SizedBox(height: 40),
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.of(context).pushReplacement(PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(seconds: 1),
                  child: const MenuPage(),
                ));
              },
            ),
          ],
        ),
      )),
    );
  }
}
