import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  final dynamic id;
  final List<dynamic> products;
  final dynamic totalprice;
  final dynamic status;
  final dynamic address;
  final dynamic orderAt;
  Order({
    required this.id,
    required this.products,
    required this.totalprice,
    required this.status,
    required this.address,
    required this.orderAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products,
      'totalprice': totalprice,
      'status': status,
      'address': address,
      'orderAt': orderAt,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] as dynamic,
      products: List<dynamic>.from((map['products'] as List<dynamic>)),
      totalprice: map['totalprice'] as dynamic,
      status: map['status'] as dynamic,
      address: map['address'] as dynamic,
      orderAt: map['orderAt'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
