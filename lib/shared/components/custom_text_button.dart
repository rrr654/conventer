import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style:const TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
