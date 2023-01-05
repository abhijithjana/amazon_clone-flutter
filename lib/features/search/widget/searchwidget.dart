import 'package:amazon_clone/model/productmodel.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final ProductModel products;
  const SearchWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.network(
            products.images[0],
            fit: BoxFit.fitHeight,
            height: 135,
            width: 135,
          )
        ],
      ),
    );
  }
}
