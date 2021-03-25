import 'package:flutter/cupertino.dart';
import 'package:loook/models/adverts_list_model.dart';

class AdvertDetailsModel {
  String name;
  List<dynamic> children;
  String url;
  int count;
  Map<dynamic, dynamic> fields;
  List<dynamic> adverts;
  AdvertDetailsModel(
      {@required this.name,
      @required this.children,
      @required this.url,
      @required this.count,
      @required this.fields,
      @required this.adverts});

  factory AdvertDetailsModel.fromJson(Map<String, dynamic> json) {
    List children =
        json['children'].map((e) => AdvertDetailsModel.fromJson(e)).toList();
    List adverts = json['adverts'] != null
        ? json['adverts'].map((e) => AdvertsListModel.fromJson(e)).toList()
        : null;
    return AdvertDetailsModel(
      name: json['name'],
      children: children,
      url: json['url'],
      count: json['count'],
      fields: json['fields'],
      adverts: adverts,
    );
  }
}
