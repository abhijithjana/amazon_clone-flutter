import 'dart:convert';

import 'package:amazon_clone/constatn/httperror.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/ipaddres.dart';
import 'package:amazon_clone/model/usermodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AddressScreenServices {
  void updateaddress({
    required BuildContext context,
    required String address,
  }) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.put(
        Uri.parse('$uri/user/updateaddress'),
        headers: {
          'Content-Type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
        body: jsonEncode({'address': address}),
      );

      // ignore: use_build_context_synchronously
      httperror(
          response: res,
          snakbar: context,
          Onsucess: () {
            UserModel user = userProvider.user
                .copyWith(address: jsonDecode(res.body)['address']);

            userProvider.onlyonevalechange(user);
          });
    } catch (e) {
      showSnakebar(context, e.toString());
    }
  }

  void placeorder(
      {required BuildContext context,
      required String address,
      required double totalprice}) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.post(
        Uri.parse('$uri/user/place-order'),
        headers: {
          'Content-Type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
        body: jsonEncode({
          'cart': userProvider.user.cart,
          'totalprice': totalprice,
          'address': address
        }),
      );

      // ignore: use_build_context_synchronously
      httperror(
          response: res,
          snakbar: context,
          Onsucess: () {
            showSnakebar(context, 'Your order is placed!');
            UserModel user = userProvider.user.copyWith(cart: []);

            userProvider.onlyonevalechange(user);
          });
    } catch (e) {
      showSnakebar(context, e.toString());
    }
  }
}
