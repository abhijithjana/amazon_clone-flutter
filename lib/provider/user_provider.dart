import 'package:amazon_clone/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
      id: "",
      name: "",
      password: "",
      address: "",
      token: "",
      type: "",
      email: "",
      cart: []);

  UserModel get user => _user;

  void setuser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }

  void onleonevalechange(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
