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
      Map<String, dynamic> token = {
        'refresh': Hive.box('tokensBox').get('refreshToken')
      };
      print('$token');
      var tokens = jsonDecode(refreshTokenResponse.body);
      print('$tokens');
      await Hive.box('tokensBox').put('accessToken', tokens['access']);
      print('can modify in access hive');
      await Hive.box('tokensBox').put('refreshToken', tokens['refresh']);
      print('can modify in refresh hive');
      ApiEndpoints.headersWithTokens.update('Authorization',
          (value) => 'Bearer ${Hive.box('tokensBox').get('accessToken')}');
      print('can modify in header');
    } catch (e) {
      print('refresh token exception $e');
    }
  }
}
