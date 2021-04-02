import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/services/api_endpoints.dart';

class AddAdvertToFavoritesListProvider {
  static void addAdvertToFavoritesList(int id) async {
    Map<String, int> body = {'id': id};
    final response = await http.post(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.favoritesApiUrl),
        headers: ApiEndpoints.headersWithToken,
        body: body);
    print(jsonDecode(response.body));
  }
}
