import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/screens/account/screens/accountscreen.dart';
import 'package:amazon_clone/features/screens/home/home.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ButoomNevigatorCustom extends StatefulWidget {
  static const String routhname = "/ButoomNevigatorCustom";
  const ButoomNevigatorCustom({super.key});

  @override
  State<ButoomNevigatorCustom> createState() => _ButoomNevigatorCustomState();
}

class _ButoomNevigatorCustomState extends State<ButoomNevigatorCustom> {
  int _pageno = 0;

  double buttombarwidth = 42;
  double buttombarborderwidth = 5;

  List<Widget> pages = [
    HomeScreen(),
    AccountScreen(),
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
    return Container(
      child: Scaffold(
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
                    child: Icon(Icons.home_outlined),
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
                    child: Icon(Icons.person_outline),
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
                    child: Badge(
                        elevation: 0,
                        badgeContent: Text("3"),
                        badgeColor: GlobalVariable.backgroundColor,
                        child: Icon(Icons.shopping_cart_outlined)),
                  )),
            ]),
      ),
    );
  }
}
