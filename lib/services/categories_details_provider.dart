import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/services/api_endpoints.dart';
import 'package:loook/services/token_refresher.dart';

class CategoriesDetailsProvider {
  static Future<List<AdvertDetailsModel>> getCategoriesDetails() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.categoriesApiUrl),
        headers: ApiEndpoints.headersWithTokens);
    if (response.statusCode == 200) {
      List<dynamic> _categoriesDetailsListJson = jsonDecode(response.body);
      print(_categoriesDetailsListJson);
      if (_categoriesDetailsListJson.isNotEmpty) {
        return _categoriesDetailsListJson
            .map<AdvertDetailsModel>((e) => AdvertDetailsModel.fromJson(e))
            .toList();
      } else {
        print('_categoriesDetailsListJson is empty');
      }
    } else if (response.statusCode == 401) {
      await TokenRefreher.refreshToken();
    }
    return null;
  }
}
