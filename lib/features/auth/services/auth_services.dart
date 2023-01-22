import 'dart:convert';

import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/constatn/httperror.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/features/screens/home/home.dart';
import 'package:amazon_clone/features/auth/widgets/buttomnevigation.dart';
import 'package:amazon_clone/ipaddres.dart';
import 'package:amazon_clone/model/usermodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signup(
      {required BuildContext context,
      required String name,
      required String password,
      required String email}) async {
    try {
      UserModel user = UserModel(
          id: "",
          name: name,
          password: password,
          address: "",
          token: "",
          type: "",
          email: email,
          cart: []);

      http.Response response = await http.post(Uri.parse('$uri/user/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; Charset=UTF-8',
          });

      httperror(
          response: response,
          snakbar: context,
          Onsucess: () => showSnakebar(
              context, "Account creation succecsfull you can signin now"));
    } catch (e) {
      showSnakebar(context, e.toString());
    }
  }

  void signin(
      {required BuildContext context,
      required String password,
      required String email}) async {
    try {
      http.Response response = await http.post(Uri.parse('$uri/user/signin'),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; Charset=UTF-8',
          });

      httperror(
          response: response,
          snakbar: context,
          Onsucess: () async {
            final prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false)
                .setuser(response.body);
            await prefs.setString(
                'auth_token', jsonDecode(response.body)['token']);

            Navigator.pushNamedAndRemoveUntil(
                context, ButoomNevigatorCustom.routhname, (route) => false);
          });
    } catch (e) {
      showSnakebar(context, e.toString());
    }
  }

  void getuserdata(BuildContext context) async {
    try {
      final pref = await SharedPreferences.getInstance();
      String? token = pref.getString('auth_token');
      if (token == null) pref.setString("auth_token", "");
      http.Response tokenres = await http.post(Uri.parse('$uri/tokenverify'),
          headers: <String, String>{
            'Content-Type': 'application/json; Charset=UTF-8',
            'auth_token': token!
          });
      var istokenvalid = jsonDecode(tokenres.body);
      if (istokenvalid) {
        http.Response userRes = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              'Content-Type': 'application/json; Charset=UTF-8',
              'auth_token': token
            });
        Provider.of<UserProvider>(context, listen: false).setuser(userRes.body);
      }
    } catch (e) {
      showSnakebar(context, e.toString());
    }
  }
}
