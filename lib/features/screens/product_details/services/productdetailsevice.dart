import 'dart:convert';

import 'package:amazon_clone/constatn/httperror.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/ipaddres.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:amazon_clone/model/usermodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailService {
  void rating({
    required BuildContext context,
    required ProductModel product,
    required double rating,
  }) async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false);
      http.Response response = await http.post(
          Uri.parse('$uri/api/rating/product'),
          headers: <String, String>{
            'content-type': 'application/json; Charset=UTF-8',
            'auth_token': user.user.token
          },
          body: jsonEncode({'id': product.id, 'rating': rating}));

      httperror(response: response, snakbar: context, Onsucess: () {});
    } catch (e) {
      showSnakebar(context, e.toString());
    }
  }
}
