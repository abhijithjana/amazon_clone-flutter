import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/auth/screens/authscreen.dart';
import 'package:amazon_clone/features/auth/screens/home/home.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/routh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthServices().getuserdata(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon clone',
      onGenerateRoute: ((settings) => generatedrouth(settings)),
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariable.secondaryColor,
          ),
          appBarTheme: AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? AuthScreen()
          : HomeScreen(),
    );
  }
}
