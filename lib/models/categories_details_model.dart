import 'package:flutter/cupertino.dart';

class AdvertDetailsModel {
  final String name;
  final List<dynamic> children;
  final String url;
  final int count;
  AdvertDetailsModel(
      {@required this.name,
      @required this.children,
      @required this.url,
      @required this.count});

  factory AdvertDetailsModel.fromJson(Map<String, dynamic> json) {
    List children = json['children']
        .map((e) => AdvertDetailsModel.fromJson(e))
        .toList();
    return AdvertDetailsModel(
      name: json['name'],
      children: children,
      url: json['url'],
      count: json['count']
    );
  }
}
