import 'dart:convert';
import 'package:hive/hive.dart';
import 'api_endpoints.dart';
import 'package:http/http.dart' as http;

class TokenRefreher {
  static Future<void> refreshToken() async {
    try {
      var refreshTokenResponse = await http.post(
          Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.refreshTokenUrl),
          body: {'refresh': Hive.box('tokensBox').get('refreshToken')});
      var tokens = jsonDecode(refreshTokenResponse.body);
      await Hive.box('tokensBox').put('accessToken', tokens['access']);
      await Hive.box('tokensBox').put('refreshToken', tokens['refresh']);
      ApiEndpoints.headersWithTokens.update('Authorization',
          (value) => 'Bearer ${Hive.box('tokensBox').get('accessToken')}');
    } catch (e) {
      print('refresh token exception $e');
    }
  }
}
