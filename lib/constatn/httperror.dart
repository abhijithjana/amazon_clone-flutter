import 'dart:convert';

import 'package:amazon_clone/constatn/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httperror(
    {required http.Response response,
    required BuildContext snakbar,
    required VoidCallback Onsucess}) {
  print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      Onsucess();
      break;
    case 400:
      showSnakebar(snakbar, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnakebar(snakbar, jsonDecode(response.body)['error']);
      break;
    default:
      showSnakebar(snakbar, jsonDecode(response.body));
  }
}
