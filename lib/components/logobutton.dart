import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  final String logo;
  final double logoWidth;
  final Color logoColor;
  const LogoButton({
    super.key,
    required this.logo,
    required this.logoColor,
    required this.logoWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      height: 60,
      textColor: Colors.black,
      color: logoColor,
      child: Image.asset(
        logo,
        width: logoWidth,
      ),
    );
  }
}
