import 'package:amazon_clone/features/address/screen/addressscreen.dart';
import 'package:amazon_clone/features/admin/screens/add_product.dart';
import 'package:amazon_clone/features/orderdetails.dart/screens/orderdetailsscreen.dart';

import 'package:amazon_clone/features/screens/home/category_page.dart';
import 'package:amazon_clone/features/screens/home/home.dart';
import 'package:amazon_clone/features/screens/product_details/screens/product_details.dart';
import 'package:amazon_clone/features/screens/search/screens/searchScreen.dart';
import 'package:amazon_clone/model/ordermodel.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/auth/authscreen.dart';
import 'features/auth/widgets/buttomnevigation.dart';

Route<dynamic> generatedrouth(RouteSettings Routesettings) {
  switch (Routesettings.name) {
    case SeacrchScreens.Routename:
      String searchelement = Routesettings.arguments as String;
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => SeacrchScreens(searchelement: searchelement));

    case ProductDetail.Routename:
      ProductModel products = Routesettings.arguments as ProductModel;
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => ProductDetail(product: products));

    case CategorPage.routename:
      String Category = Routesettings.arguments as String;
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => CategorPage(category: Category));
    case AddProduct.routename:
      return MaterialPageRoute(
          settings: Routesettings, builder: (context) => AddProduct());
    case AddressScreen.routename:
      String totalamount = Routesettings.arguments as String;
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => AddressScreen(
                totalamaount: totalamount,
              ));
    case OrderdetailsScreen.routename:
      Order order = Routesettings.arguments as Order;
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => OrderdetailsScreen(order: order));
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
