import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:loook/services/api_endpoints.dart';

class AuthenticationProvider {
  static Future<String> signIn(
      {@required String username, @required String password}) async {
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };
    final response = await http.post(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.loginApiUrl),
        headers: ApiEndpoints.headersWithNoTokens,
        body: json.encode(body));
    final Map<String, dynamic> responseBody = json.decode(response.body);
    Map<String, dynamic> tokens = {
      'access': responseBody['access'],
      'refresh': responseBody['refresh'],
    };
    await Hive.box('tokensBox').put('accessToken', tokens['access']);
    await Hive.box('tokensBox').put('refreshToken', tokens['refresh']);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return 'Signed in successfully';
    } else if (response.statusCode == 401) {
      return 'Such a user is not exist';
    }
    return 'Signing in error';
  }

  static Future<String> signUp(
      {@required String username,
      @required String password,
      @required String phoneNumber}) async {
    final Map<String, String> body = {
      'username': username,
      'password': password,
      'phone': phoneNumber,
    };
    final response = await http.post(
        Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.registerApiUrl),
        headers: ApiEndpoints.headersWithNoTokens,
        body: json.encode(body));
    print('${json.encode(body)}');
    print('${jsonDecode(response.body)}');
    if (response.statusCode == 201) {
      return 'Signed up successfully';
    } else if (response.statusCode == 400) {
      if (jsonDecode(response.body)['username'][0] ==
          'Пользователь с таким именем уже существует.') {
        return 'Such a user already exists';
      }
    }
    return 'Signing up error';
  }

  static signOut() {
    Hive.box('tokensBox')..delete('accessToken')..delete('refreshToken');
  }
}
