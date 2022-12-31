import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone/constatn/httperror.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/ipaddres.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct(
      {required BuildContext context,
      required String productname,
      required String description,
      required double price,
      required double qualtity,
      required String category,
      required List<File> images}) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final cloudnary = CloudinaryPublic('duedmv5ya', 'sraed5ez');

      List<String> imageurl = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse resp = await cloudnary.uploadFile(
            CloudinaryFile.fromFile(images[i].path,
                folder: productname,
                resourceType: CloudinaryResourceType.Image));
        imageurl.add(resp.secureUrl);
      }

      ProductModel product = ProductModel(
          name: productname,
          description: description,
          price: price,
          qualtity: qualtity,
          category: category,
          images: imageurl);

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-Product'),
        headers: {
          'Content-Type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
        body: product.toJson(),
      );

      httperror(
          response: res,
          snakbar: context,
          Onsucess: () {
            showSnakebar(context, 'Product added sucessfully ');

            Navigator.pop(context, 'refresh');
          });
    } catch (e) {
      print('$e');
      showSnakebar(context, e.toString());
    }
  }

  Future<List<ProductModel>> fetchallproduct(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ProductModel> productlist = [];
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/admin/getproduct'),
        headers: <String, String>{
          'content-type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
      );

      httperror(
          response: response,
          snakbar: context,
          Onsucess: (() {
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

  void deleteproduct(
      String id, BuildContext context, VoidCallback onScucesss) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/deleteproduct'),
        headers: <String, String>{
          'content-type': 'application/json; Charset=UTF-8',
          'auth_token': userProvider.user.token
        },
        body: jsonEncode({'id': id}),
      );

      httperror(
          response: res,
          snakbar: context,
          Onsucess: () {
            onScucesss;
          });

      print(res.body);
    } catch (e) {
      showSnakebar(context, e.toString());
    }
  }
}
