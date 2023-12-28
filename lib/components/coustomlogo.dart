import 'package:flutter/material.dart';

class CoustomLogo extends StatelessWidget {
  const CoustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.yellow[500],
          borderRadius: BorderRadius.circular(80),
        ),
        child: Image.asset(
          "images/logo.png",
          height: 70,
        ),
      ),
    );
  }
}
