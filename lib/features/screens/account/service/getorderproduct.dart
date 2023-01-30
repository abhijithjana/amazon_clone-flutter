import 'dart:convert';

import 'package:amazon_clone/constatn/httperror.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/ipaddres.dart';
import 'package:amazon_clone/model/ordermodel.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetorderProduc {
  Future<List<Order>> getproduct({required BuildContext context}) async {
    List<Order> orderp = [];
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.get(
        Uri.parse('$uri/user/order'),
        headers: {
          'Content-Type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
      );

      // ignore: use_build_context_synchronously
      httperror(
          response: res,
          snakbar: context,
          Onsucess: () {
            for (int i = 0; i < jsonDecode((res.body)).length; i++) {
              orderp.add(Order.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnakebar(context, e.toString());
    }
    return orderp;
  }
}
