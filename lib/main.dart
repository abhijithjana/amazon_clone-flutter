import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/auth/screens/authscreen.dart';
import 'package:amazon_clone/routh.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: ((settings) => generatedrouth(settings)),
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariable.secondaryColor,
          ),
          appBarTheme: AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
          centerTitle: true,
        ),
        body: Center(
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AuthScreen.routhname);
              },
              child: Text("click me "),
            );
          }),
        ),
      ),
    );
  }
}
