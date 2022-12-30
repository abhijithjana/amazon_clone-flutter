import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String name;
  final String description;
  final double price;
  final double qualtity;
  final String category;
  final List<String> images;
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
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      price: map['price'] ?? 0.0,
      qualtity: map['qualtity'] ?? 0.0,
      category: map['category'] ?? "",
      images: List<String>.from(map['images']),
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
