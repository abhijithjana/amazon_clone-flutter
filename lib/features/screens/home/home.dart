import 'dart:ui';

import 'package:amazon_clone/features/screens/home/widget/address_box.dart';
import 'package:amazon_clone/features/screens/home/widget/carosel_image.dart';
import 'package:amazon_clone/features/screens/home/widget/deal_of_the_day.dart';
import 'package:amazon_clone/features/screens/home/widget/topCategory.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:amazon_clone/constatn/globalvariable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    height: 40,
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(7),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                  width: 1,
                                )),
                            hintText: "Search on amazon.in",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.transparent,
                height: 42,
                child: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategory(),
            SizedBox(
              height: 10,
            ),
            Carosel_image(),
            DealOfTheDay()
          ],
        ),
      ),
    );
  }
}
