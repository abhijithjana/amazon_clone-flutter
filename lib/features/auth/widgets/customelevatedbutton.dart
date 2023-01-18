import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomElevatedBustton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final Color? color;
  const CustomElevatedBustton(
      {super.key, required this.text, required this.ontap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            primary: color, minimumSize: const Size(double.infinity, 50)),
        child: Text(
          text,
          style: TextStyle(color: color == null ? Colors.white : Colors.black),
        ));
  }
}
