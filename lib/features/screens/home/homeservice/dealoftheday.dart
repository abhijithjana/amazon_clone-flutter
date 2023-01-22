import 'package:amazon_clone/constatn/httperror.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/ipaddres.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DealOfTheDy {
  Future<ProductModel> fetchdeal({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    ProductModel product = ProductModel(
        name: '',
        description: '',
        price: 0.0,
        qualtity: 0,
        category: '',
        images: []);
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/product/dealoftheday'),
        headers: <String, String>{
          'content-type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
      );

      httperror(
          response: response,
          snakbar: context,
          Onsucess: (() {
            product = ProductModel.fromJson(response.body);
          }));
    } catch (e) {
      print(e);
      showSnakebar(context, e.toString());
    }
    return product;
  }
}
