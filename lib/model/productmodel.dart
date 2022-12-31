import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final dynamic name;
  final dynamic description;
  final dynamic price;
  final dynamic qualtity;
  final dynamic category;
  final List<dynamic> images;
  final String? id;
  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.qualtity,
    required this.category,
    required this.images,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'qualtity': qualtity,
      'category': category,
      'images': images,
      'id': id,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as dynamic,
      description: map['description'] as dynamic,
      price: map['price'] as dynamic,
      qualtity: map['qualtity'] as dynamic,
      category: map['category'] as dynamic,
      images: List<dynamic>.from(map['images'] as List<dynamic>),
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
