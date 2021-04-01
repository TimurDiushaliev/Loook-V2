import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/services/api_endpoints.dart';

class CategoriesDetailsProvider {
  static Future<List<AdvertDetailsModel>> getCategoriesDetails() async {
    try {
      final response = await http.get(
          Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.categoriesApiUrl),
          headers: ApiEndpoints.headersWithNoTokens);
      if (response.statusCode == 200) {
        List<dynamic> _categoriesDetailsListJson = jsonDecode(response.body);
        if (_categoriesDetailsListJson.isNotEmpty) {
          return _categoriesDetailsListJson
              .map<AdvertDetailsModel>((e) => AdvertDetailsModel.fromJson(e))
              .toList();
        } else {
          print('_categoriesDetailsListJson is empty');
        }
      } else {
        throw Exception('Failed to load categories details');
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }
}
