import 'dart:convert';

import 'package:amazon_clone/constatn/httperror.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/ipaddres.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Searchservice {
  Future<List<ProductModel>> fetchsearchproduct(
      {required BuildContext context, required String searchelement}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ProductModel> productlist = [];
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/product/search/$searchelement'),
        headers: <String, String>{
          'content-type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
      );

      httperror(
          response: response,
          snakbar: context,
          Onsucess: (() {
            print(searchelement);
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              productlist.add(ProductModel.fromJson(
                  jsonEncode(jsonDecode(response.body)[i])));
            }
          }));
    } catch (e) {
      print(e);
      showSnakebar(context, e.toString());
    }
    return productlist;
  }
}
