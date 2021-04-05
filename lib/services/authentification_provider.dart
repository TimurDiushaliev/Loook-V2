import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:loook/services/api_endpoints.dart';

class AuthenticationProvider {
  static StreamController signUpState = StreamController();
  static StreamController signInState = StreamController();
  static Future signIn(
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
      Hive.box('tokensBox')
        ..put('accessToken', tokens['access'])
        ..put('refreshToken', tokens['refresh']);
    } catch (e) {
      print('server exception $e');
    }
  }

  static Future signUp(
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
      if (response.statusCode == 201) {
        //TODO: success auth
        signUpState.sink.add('signed up successfully');
        print(jsonDecode(response.body));
      } else if(response.statusCode==400) {
        //TODO: error auth
        print(response.statusCode);
        signUpState.sink.add('such a user already exists');
      }
    } catch (e) {}
  }

  static signOut() {
    Hive.box('tokensBox')..delete('accessToken')..delete('refreshToken');
  }
}
