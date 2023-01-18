import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carosel_image extends StatelessWidget {
  const Carosel_image({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariable.carouselImages.map(
        (e) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              e,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        },
      ).toList(),
      options:
          CarouselOptions(viewportFraction: 1, height: 200, autoPlay: true),
    );
  }
}
