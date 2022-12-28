import 'package:flutter/material.dart';

class CustomTextInputfeild extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxline;

  const CustomTextInputfeild(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxline = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return "Enter your $hint";
        } else {
          return null;
        }
      }),
    );
  }
}
