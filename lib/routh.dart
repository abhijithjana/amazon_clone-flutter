import 'package:amazon_clone/features/admin/screens/add_product.dart';
import 'package:amazon_clone/features/screens/authscreen.dart';
import 'package:amazon_clone/features/screens/home/category_page.dart';
import 'package:amazon_clone/features/screens/home/home.dart';
import 'package:amazon_clone/features/search/screens/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/auth/widgets/buttomnevigation.dart';

Route<dynamic> generatedrouth(RouteSettings Routesettings) {
  switch (Routesettings.name) {
    case SeacrchScreens.Routename:
      String searchelement = Routesettings.arguments as String;
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => SeacrchScreens(searchelement: searchelement));

    case CategorPage.routename:
      String Category = Routesettings.arguments as String;
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => CategorPage(category: Category));
    case AddProduct.routename:
      return MaterialPageRoute(
          settings: Routesettings, builder: (context) => AddProduct());

    case ButoomNevigatorCustom.routhname:
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => ButoomNevigatorCustom());
    case AuthScreen.routhname:
      return MaterialPageRoute(
          settings: Routesettings, builder: (context) => AuthScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: Routesettings, builder: (context) => HomeScreen());
    default:
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => Scaffold(
                body: Center(child: Text("Unable to find the page ")),
              ));
  }
}
