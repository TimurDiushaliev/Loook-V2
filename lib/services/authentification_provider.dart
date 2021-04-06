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
    try {
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
      } else {}
    } catch (e) {
      print('Sign in exception $e');
      return 'Signed in error';
    }
    return null;
  }

  static Future<String> signUp(
      {@required String username,
      @required String password,
      @required String phoneNumber}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final Map<String, String> body = {
      'username': username,
      'password': password,
      'phone': phoneNumber,
    };
    try {
      final response = await http.post(
          Uri.http(ApiEndpoints.baseUrl, ApiEndpoints.registerApiUrl),
          headers: headers,
          body: json.encode(body));
      print('${jsonDecode(response.body)}');
      if (response.statusCode == 201) {
        return 'Signed up successfully';
      } else if (response.statusCode == 400) {
        return 'Such a user already exists';
      }
    } catch (e) {
      print('Sign Up Error $e');
    }
    return null;
  }

  static signOut() {
    Hive.box('tokensBox')..delete('accessToken')..delete('refreshToken');
  }
}
