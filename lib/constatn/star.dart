import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Star extends StatelessWidget {
  final double initialrating;
  const Star({super.key, required this.initialrating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: initialrating,
      itemCount: 5,
      itemSize: 15,
      direction: Axis.horizontal,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: GlobalVariable.secondaryColor,
      ),
    );
  }
}
