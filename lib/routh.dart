import 'package:amazon_clone/features/auth/screens/authscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generatedrouth(RouteSettings Routesettings) {
  switch (Routesettings.name) {
    case AuthScreen.routhname:
      return MaterialPageRoute(
          settings: Routesettings, builder: (context) => AuthScreen());
    default:
      return MaterialPageRoute(
          settings: Routesettings,
          builder: (context) => Scaffold(
                body: Center(child: Text("Unable to find the page ")),
              ));
  }
}
