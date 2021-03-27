import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider {
  static Future signIn(
      {@required String username, @required String password}) async {
    final String baseUrl = '192.168.88.208';
    final String apiUrl = 'api/v1/login/';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };
    try {
      final response = await http.post(Uri.http(baseUrl, apiUrl),
          headers: headers, body: json.encode(body));
      print('username $username password $password');
      final Map<String, dynamic> responseBody = json.decode(response.body);
      Map<String, dynamic> tokens = {
        'access': responseBody['access'],
        'refresh': responseBody['refresh'],
      };
      print('$responseBody');
      print('tokens $tokens');
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
    final String baseUrl = '192.168.88.208:8000';
    final String apiUrl = 'api/v1/register/';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final Map<String, String> body = {
      'username': username,
      'password': password,
      'phone': phoneNumber,
    };
    try {
      print('$username $password $phoneNumber    ');
      final response = await http.post(Uri.http(baseUrl, apiUrl),
          headers: headers, body: json.encode(body));
      print('${jsonDecode(response.body)}');
      if (response.statusCode == 201) {
        //TODO: success auth
      } else {
        //TODO: error auth
      }
    } catch (e) {}
  }
}
