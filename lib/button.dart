import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const MyButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(212, 135, 81, 77),
            borderRadius: BorderRadius.circular(25)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.arrow_forward_sharp,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
