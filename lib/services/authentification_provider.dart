import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider {
  // String phone = '145431';

  static Future signIn(
      {@required String username, @required String password}) async {
    final String baseUrl = '192.168.88.208:8000';
    final String apiUrl = 'api/v1/auth/jwt/create/';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final Map<String, String> body = {
      'username': username,
      'password': password,
      // 'phone': phone,
    };
    try {
      final response = await http.post(Uri.http(baseUrl, apiUrl),
          headers: headers, body: json.encode(body));
      final Map<String, dynamic> responseBody = json.decode(response.body);
      Map<String, dynamic> tokens = {
        'access': responseBody['access'],
        'refresh': responseBody['refresh'],
      };
      print('tokens $tokens');
      var box = Hive.box('tokensBox');
      box.put('accessToken', tokens['access']);
      box.put('refreshToken', tokens['refresh']);
      print('${box.get('accessToken')}');
    } catch (e) {
      print('server exception $e');
    }
  }
}
