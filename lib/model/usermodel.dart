import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String name;
  final String password;
  final String address;
  final String token;
  final String type;
  final String email;
  UserModel({
    required this.id,
    required this.name,
    required this.password,
    required this.address,
    required this.token,
    required this.type,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'address': address,
      'token': token,
      'type': type,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      token: map['token'] as String,
      type: map['type'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
