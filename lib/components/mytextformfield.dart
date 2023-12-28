import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String myHintText;
  final TextEditingController myController;
  final TextInputType inputType;
  final String? Function(String?)? validator;

  const MyTextFormField({
    super.key,
    required this.myHintText,
    required this.myController,
    required this.inputType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: myController,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        hintText: myHintText,
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        fillColor: Colors.grey[300],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.yellow[300]!,
          ),
        ),
      ),
    );
  }
}
