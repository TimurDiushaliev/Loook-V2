import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/models/categories_details_model.dart';

class CategoriesDetailsProvider {
  static Future<List<AdvertDetailsModel>> getCategoriesDetails() async {
    final String baseUrl = '192.168.88.208';
    final String apiUrl = 'api/v1/category/list';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    try {
      final response =
          await http.get(Uri.http(baseUrl, apiUrl), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> _categoriesDetailsListJson = jsonDecode(response.body);
        print(' asd$_categoriesDetailsListJson');
        if (_categoriesDetailsListJson.isNotEmpty) {
          return _categoriesDetailsListJson
              .map<AdvertDetailsModel>((e) => AdvertDetailsModel.fromJson(e))
              .toList();
        } else {
          print('_categoriesDetailsListJson is empty');
        }
      } else
        throw Exception('Failed to load categories details');
    } catch (e) {
      print('$e');
    }
    return null;
  }
}
