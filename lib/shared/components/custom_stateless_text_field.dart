import 'package:flutter/material.dart';

class CustomStatelessTextField extends StatelessWidget {
  const CustomStatelessTextField({Key? key, required this.lableText, this.controller}) : super(key: key);
final String lableText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      style: TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
        label: Text(
          lableText,
          style: const TextStyle(
              color: Color(0xffE5E2E2FF),
              fontSize: 16
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1.25
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1.25
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1.25
          ),
        ),
      ),
    );
  }
}
