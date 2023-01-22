import 'dart:ui';

import 'package:amazon_clone/constatn/star.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  final ProductModel products;
  const SearchWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double totalrating = 0;
    print(products.rating![0].rating + totalrating);
    for (int i = 0; i < products.rating!.length; i++) {
      totalrating += products.rating![i].rating;
    }
    double avg = 0;
    if (totalrating != 0) avg = totalrating / products.rating!.length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.network(
            products.images[0],
            fit: BoxFit.contain,
            height: 135,
            width: 135,
          ),
          Column(
            children: [
              Container(
                width: 235,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  products.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Star(
                  initialrating: avg,
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  '${products.price}₹',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  'Eligible for free shiffting',
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  'In stock',
                  style: const TextStyle(color: Colors.teal),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
