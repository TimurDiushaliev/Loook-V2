import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/models/adverts_model.dart';
import 'package:loook/services/api_endpoints.dart';
import 'package:loook/services/token_refresher.dart';

class AdvertsProvider {
  static Future<List<dynamic>> fetchAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.adsApiUrl),
        headers: ApiEndpoints.headersWithTokens);
    if (response.statusCode == 200) {
      List<dynamic> adverts = jsonDecode(response.body);
      return adverts.map((json) => AdvertsModel.fromJson(json)).toList();
    }
    if (response.statusCode == 401) {
      await TokenRefreher.refreshToken();
      fetchAdvertsList();
    }
    throw Exception('Fetching adverts list failed');
  }

  static Future<List<dynamic>> fetchAccountAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.accountAdsApiUrl),
        headers: ApiEndpoints.headersWithTokens);
    if (response.statusCode == 200) {
      List<dynamic> accountAdverts = jsonDecode(response.body);
      return accountAdverts.map((json) => AdvertsModel.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      await TokenRefreher.refreshToken();
      fetchAccountAdvertsList();
    }
    throw Exception('Fetching user adverts failed');
  }

  static Future<AdvertsModel> fetchAdvertById(int id) async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.advertByIdApiUrl + '$id'),
        headers: ApiEndpoints.headersWithTokens);
    if (response.statusCode == 200) {
      Map<String, dynamic> advertById = jsonDecode(response.body);
      return AdvertsModel.fromJson(advertById);
    }

    if (response.statusCode == 401) {
      await TokenRefreher.refreshToken();
      fetchAdvertsList();
    }
    throw Exception('Fetching advert by id failed');
  }

  static Future<List<AdvertsModel>> fetchAdvertsBySearchDelegate(
      String query, int offset) async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.adsApiUrl,
            {'title': query, 'limit': '10', 'offset': '$offset'}),
        headers: ApiEndpoints.headersWithTokens);
    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['results'];
      return results.map((e) => AdvertsModel.fromJson(e)).toList();
    } else if (response.statusCode == 401) {
      await TokenRefreher.refreshToken();
      fetchAdvertsBySearchDelegate(query, offset);
    }
    throw Exception('Fetching adverts by search delegate failed');
  }
}
