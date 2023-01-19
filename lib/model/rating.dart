import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RatingModel {
  final dynamic userid;
  final dynamic rating;
  RatingModel({
    required this.userid,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userid,
      'rating': rating,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      userid: map['userid'] as dynamic,
      rating: map['rating'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) =>
      RatingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
