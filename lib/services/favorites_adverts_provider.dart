import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loook/models/adverts_model.dart';
import 'package:loook/services/api_endpoints.dart';
import 'package:loook/services/token_refresher.dart';

class FavoriteAdvetsProvider {
  static void addAdvertToFavoritesList(int id) async {
    Map<String, int> body = {'id': id};
    final response = await http.post(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.favoritesApiUrl),
        headers: ApiEndpoints.headersWithTokens,
        body: jsonEncode(body));
    if (response.statusCode == 401) {
      TokenRefreher.refreshToken();
      //TODO: refresh state
    }
  }

  static Future<List<AdvertsModel>> fetchFavoriteAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.favoritesApiUrl),
        headers: ApiEndpoints.headersWithTokens);
    if (response.statusCode == 200) {
      List<dynamic> favoriteAdverts = jsonDecode(response.body);
      return favoriteAdverts.map((e) => AdvertsModel.fromJson(e)).toList();
    }
    if (response.statusCode == 401) {
      await TokenRefreher.refreshToken();
    }
    return null;
  }
}
