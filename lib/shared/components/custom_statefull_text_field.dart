import 'package:flutter/material.dart';

class CustomStateFullTextField extends StatefulWidget {
  const CustomStateFullTextField({Key? key, required this.text,  this.controller}) : super(key: key);
final String text;
final TextEditingController? controller;
  @override
  State<CustomStateFullTextField> createState() => _CustomStateFullTextFieldState();
}

class _CustomStateFullTextFieldState extends State<CustomStateFullTextField> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(
        color: Colors.white
      ),
      obscureText: isShow,
      decoration: InputDecoration(
        label: Text(
          widget.text,
          style: const TextStyle(
              color: Color(0xffE5E2E2FF),
              fontSize: 16
          ),
        ),
        suffixIcon:IconButton(
          onPressed: () {
            setState(() {
              isShow = !isShow;
            });
          },
          icon: Icon(
            isShow?Icons.visibility_off:Icons.visibility,
            color: Color(0xffe5e2e2ff),
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
