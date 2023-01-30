import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSubTotal extends StatelessWidget {
  final int sum;
  const CartSubTotal({super.key, required this.sum});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(10),
      child: RichText(
        text: TextSpan(
            text: 'Subtotal ₹',
            style: TextStyle(fontSize: 20, color: Colors.black),
            children: [
              TextSpan(
                  text: '$sum',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
            ]),
      ),
    );
  }
}
