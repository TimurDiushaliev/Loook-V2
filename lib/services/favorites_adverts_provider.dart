import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/models/adverts_model.dart';
import 'package:loook/services/api_endpoints.dart';
import 'package:loook/services/refresh_token.dart';

class FavoriteAdvetsProvider {
  static void addAdvertToFavoritesList(int id) async {
    Map<String, int> body = {'id': id};
    final response = await http.post(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.favoritesApiUrl),
        headers: ApiEndpoints.headersWithToken,
        body: jsonEncode(body));
    print(jsonDecode(response.body));
    if (response.statusCode == 401) {
      TokenRefreher.refreshToken();
      addAdvertToFavoritesList(id);
    }
  }

  static Future<List<AdvertsModel>> fetchFavoriteAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.favoritesApiUrl),
        headers: ApiEndpoints.headersWithToken);
    if (response.statusCode == 200) {
      List<dynamic> favoriteAdverts = jsonDecode(response.body);
      return favoriteAdverts.map((e) => AdvertsModel.fromJson(e)).toList();
    }
    if (response.statusCode == 401) {
      TokenRefreher.refreshToken();
      fetchFavoriteAdvertsList();
    }
  }
}
