import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:loook/models/adverts_list_model.dart';
import 'package:loook/services/api_endpoints.dart';

class AdvertsListProvider {
  static Future<List<dynamic>> fetchAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.adsApiUrl),
        headers: ApiEndpoints.headersWithNoTokens);
    List<dynamic> adverts = jsonDecode(response.body);
    return adverts.map((json) => AdvertsListModel.fromJson(json)).toList();
  }

  static Future<List<dynamic>> fetchAccountAdvertsList() async {
    final response = await http.get(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.accountAdsApiUrl),
        headers: ApiEndpoints.headersWithToken);
    if (response.statusCode == 200) {
      List<dynamic> accountAdverts = jsonDecode(response.body);
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
}
