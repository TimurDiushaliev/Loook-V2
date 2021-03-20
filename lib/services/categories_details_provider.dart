import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/models/categories_details_model.dart';

class CategoriesDetailsProvider {
  static Future<List<CategoriesDetailsModel>> getCategoriesDetails() async {
    final String baseUrl = '192.168.88.208:8000';
    final String apiUrl = 'api/v1/category/list';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    try {
      final response =
          await http.get(Uri.http(baseUrl, apiUrl), headers: headers);
      print('${json.decode(response.body)}');
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        List<Map<dynamic, dynamic>> _categoriesDetailsListJson =
            json.decode(response.body);
        if (_categoriesDetailsListJson.isNotEmpty) {
          print('1$_categoriesDetailsListJson');
          return _categoriesDetailsListJson
              .map((e) => CategoriesDetailsModel.fromJson(e))
              .toList();
        } else {
          print('objects');
        }
      } else
        throw Exception('Failed to load categories details');
    } catch (e) {
      print('$e');
    }
  }
}