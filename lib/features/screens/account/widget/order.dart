import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/screens/account/widget/singleproduct.dart';
import 'package:flutter/material.dart';

class Oders extends StatefulWidget {
  const Oders({super.key});

  @override
  State<Oders> createState() => _OdersState();
}

class _OdersState extends State<Oders> {
  List<String> list = [
    "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1567&q=80",
    "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1567&q=80",
    "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1567&q=80",
    "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1567&q=80"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Your Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(color: GlobalVariable.selectedNavBarColor),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 0),
          height: 170,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(src: list[index]);
              }),
        )
      ]),
    );
  }
}
