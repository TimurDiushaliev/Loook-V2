import 'dart:convert';

import 'package:flutter/cupertino.dart';

class AdvertsListModel {
  int id;
  List<dynamic> images;
  String category;
  List<dynamic> comments;
  String title;
  String description;
  int price;
  String currency;
  int views;
  bool isVip;
  DateTime createdAt;
  Map<String, dynamic> fields;
  bool isActive;
  int owner;
  AdvertsListModel(
      {@required this.id,
      @required this.images,
      @required this.category,
      @required this.comments,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.currency,
      @required this.views,
      @required this.isVip,
      @required this.createdAt,
      @required this.fields,
      @required this.isActive,
      @required this.owner});

  factory AdvertsListModel.fromJson(Map<String, dynamic> json) {
    return AdvertsListModel(
      id: json['id'],
      images: json['images'],
      category: json['category'],
      comments: json['comments'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      currency: json['currency'],
      views: json['views'],
      isVip: json['isVip'],
      createdAt: json['createdAt'],
      fields:  json['fields'],// != null ? jsonDecode(json['fields']) : {},
      isActive: json['isActive'],
      owner: json['owner'],
    );
  }
}
