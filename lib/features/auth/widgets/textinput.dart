import 'package:flutter/material.dart';

class CustomTextInputfeild extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const CustomTextInputfeild(
      {super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
      validator: ((value) {}),
    );
  }
}
