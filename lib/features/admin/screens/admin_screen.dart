import 'package:amazon_clone/features/admin/screens/product.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constatn/globalvariable.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _pageno = 0;

  double buttombarwidth = 42;

  double buttombarborderwidth = 5;

  List<Widget> pages = [
    const Myproduct(),
    Center(
      child: Text("Card"),
    ),
    Center(
      child: Text("Card"),
    )
  ];

  void updatepage(int page) {
    setState(() {
      _pageno = page;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 125,
                    height: 40,
                    color: Colors.black,
                  )),
              Text(
                "Admin",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 24),
              )
            ],
          ),
        ),
      ),
      body: pages[_pageno],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageno,
          selectedItemColor: GlobalVariable.selectedNavBarColor,
          unselectedItemColor: GlobalVariable.unselectedNavBarColor,
          backgroundColor: GlobalVariable.backgroundColor,
          iconSize: 28,
          onTap: updatepage,
          items: [
            BottomNavigationBarItem(
                label: "",
                icon: Container(
                  width: buttombarwidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _pageno == 0
                                  ? GlobalVariable.selectedNavBarColor
                                  : GlobalVariable.backgroundColor,
                              width: buttombarborderwidth))),
                  child: Icon(Icons.production_quantity_limits_outlined),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Container(
                  width: buttombarwidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _pageno == 1
                                  ? GlobalVariable.selectedNavBarColor
                                  : GlobalVariable.backgroundColor,
                              width: buttombarborderwidth))),
                  child: Icon(Icons.analytics_outlined),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Container(
                  width: buttombarwidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _pageno == 2
                                  ? GlobalVariable.selectedNavBarColor
                                  : GlobalVariable.backgroundColor,
                              width: buttombarborderwidth))),
                  child: Icon(Icons.all_inbox_outlined),
                )),
          ]),
    );
  }
}
