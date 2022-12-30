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
      print(res.body);

      httperror(
          response: res,
          snakbar: context,
          Onsucess: () {
            showSnakebar(context, 'Product added sucessfully ');
            Navigator.pop(context);
          });
    } catch (e) {
      print('$e');
      showSnakebar(context, e.toString());
    }
  }
}
