import 'package:amazon_clone/constatn/buffering.dart';
import 'package:amazon_clone/features/screens/home/homeservice/dealoftheday.dart';
import 'package:amazon_clone/features/screens/product_details/screens/product_details.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  ProductModel? product;
  final deal = DealOfTheDy();
  @override
  void initState() {
    fetchproduct();
    // TODO: implement initState
    super.initState();
  }

  void fetchproduct() async {
    product = await deal.fetchdeal(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? Loading()
        : (product!.name.toString()).isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ProductDetail.Routename,
                    arguments: product),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 15, left: 10),
                      child: const Text(
                        'Deal Of The Day',
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                    Container(
                      child: Image.network(
                        product!.images[0],
                        height: 235,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "${product!.price}₹",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15, top: 10, right: 40),
                      child: Text(
                        product!.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: product!.images
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.network(
                                    e,
                                    fit: BoxFit.fitWidth,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "See all deal",
                        style: TextStyle(color: Colors.cyan[800]),
                      ),
                    )
                  ],
                ),
              );
  }
}
