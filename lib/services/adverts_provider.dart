import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:loook/models/adverts_model.dart';
import 'package:loook/services/api_endpoints.dart';
import 'package:loook/services/refresh_token.dart';

class AdvertsProvider {
  static Future<List<dynamic>> fetchAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.adsApiUrl),
        headers: ApiEndpoints.headersWithNoTokens);
    List<dynamic> adverts = jsonDecode(response.body);
    return adverts.map((json) => AdvertsModel.fromJson(json)).toList();
  }

  static Future<List<dynamic>> fetchAccountAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.accountAdsApiUrl),
        headers: ApiEndpoints.headersWithToken);
    if (response.statusCode == 200) {
      List<dynamic> accountAdverts = jsonDecode(response.body);
      return accountAdverts.map((json) => AdvertsModel.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      TokenRefreher.refreshToken();
      fetchAccountAdvertsList();
    }
  }

  static Future<AdvertsModel> fetchAdvertById(int id) async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.advertByIdApiUrl + '$id'),
        headers: ApiEndpoints.headersWithNoTokens);
    Map<String, dynamic> advertById = jsonDecode(response.body);
    return AdvertsModel.fromJson(advertById);
  }

  static Future<List<AdvertsModel>> fetchAdvertsBySearchDelegate(
      String query, int offset) async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.adsApiUrl,
            {'title': query, 'limit': '10', 'offset': '$offset'}),
        headers: ApiEndpoints.headersWithNoTokens);
    List<dynamic> results = jsonDecode(response.body)['results'];
    return results.map((e) => AdvertsModel.fromJson(e)).toList();
  }
}
