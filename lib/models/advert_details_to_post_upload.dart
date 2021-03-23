import 'package:flutter/cupertino.dart';

class AdvertDetailsToUpload {
  List<dynamic> images = [];
  String title;
  String description;
  int price;
  String currency;
  List<dynamic> fields;

  AdvertDetailsToUpload(
      {@required this.images,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.currency,
      @required this.fields});

  factory AdvertDetailsToUpload.toJson(Map<String, dynamic> json) {
    return AdvertDetailsToUpload(
      images: json['images'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      currency: json['currency'],
      fields: json['fields'],
    );
  }
}
