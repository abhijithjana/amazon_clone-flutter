import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomElevatedBustton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const CustomElevatedBustton(
      {super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            backgroundColor: GlobalVariable.secondaryColor,
            minimumSize: const Size(double.infinity, 50)),
        child: Text(text));
  }
}
