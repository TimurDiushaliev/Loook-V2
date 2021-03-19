import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CategoriesDetailsModel {
  final String name;
  final List<CategoriesDetailsModel> children;
  final String url;
  final int count;
  CategoriesDetailsModel(
      {@required this.name,
      @required this.children,
      @required this.url,
      @required this.count});

  factory CategoriesDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDetailsModel(
      name: json['name'],
      children: json['children'] ,
      url: json['url'],
      count: json['count'],
    );
  }
}
