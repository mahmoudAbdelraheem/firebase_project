import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onPressed;

  const CoustomButton(
      {super.key,
      required this.buttonText,
      required this.backgroundColor,
      required this.onPressed,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      height: 50,
      // textColor: Colors.black,
      textColor: textColor,
      // color: Colors.yellow[500],
      color: backgroundColor,
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
