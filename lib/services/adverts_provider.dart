import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:loook/models/adverts_model.dart';
import 'package:loook/services/api_endpoints.dart';

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
      try {
        if (Hive.box('tokensBox').get('refreshToken') != null) {
          final reponse = await http.post(
              Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.refreshTokenUrl),
              body: {'refresh': Hive.box('tokensBox').get('refreshToken')});
          if (jsonDecode(response.body)['refresh'] != null) {
            Hive.box('tokensBox')
              ..put('refreshToken', jsonDecode(response.body)['refresh'])
              ..put('accessToken', jsonDecode(response.body)['access']);
          }
          //TODO: return user adverts
        }
      } catch (e) {
        print('refresh token exception $e');
      }
    }
  }

  static Future<AdvertsModel> fetchAdvertById(int id) async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.advertByIdApiUrl + '$id'),
        headers: ApiEndpoints.headersWithNoTokens);
    Map<String, dynamic> advertById = jsonDecode(response.body);
    return AdvertsModel.fromJson(advertById);
  }

  static Future<List<AdvertsModel>> fetchAdvertsBySearchDelegate(String query, int offset) async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.adsApiUrl,
            {'title': query, 'limit': '10', 'offset': '$offset'}),
        headers: ApiEndpoints.headersWithNoTokens);
    List<dynamic> results = jsonDecode(response.body)['results'];
    return results.map((e) => AdvertsModel.fromJson(e)).toList();
  }
}
