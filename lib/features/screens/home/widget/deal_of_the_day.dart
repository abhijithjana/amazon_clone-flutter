import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            "https://images.unsplash.com/photo-1526925712774-2833a7ecd0d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1hY2Jvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
            height: 235,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "₹87000.00",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, top: 10, right: 40),
          child: Text(
            'Macbook M1',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1529&q=80",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1529&q=80",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1529&q=80",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1529&q=80",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1529&q=80",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 100,
                  ),
                ),
                Row(
                  children: [
                    Image.network(
                      "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1529&q=80",
                      fit: BoxFit.fitWidth,
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1529&q=80",
                    fit: BoxFit.fitWidth,
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deal",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
