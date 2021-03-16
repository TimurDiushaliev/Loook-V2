import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthenticationProvider {
  String phone = '145431';
  final String baseUrl = '192.168.88.233:8000';
  final String apiUrl = 'api/v1/register/';
  Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };
  Future signUp(String username, String password) async {
    final Map<String, String> body = {
      'username': username,
      'password': password,
      'phone': phone,
    };
    try {
      final response = await http.post(Uri.http(baseUrl, apiUrl),
          headers: headers, body: json.encode(body));
      print('${json.decode(response.body)}');
    } catch (e) {
      print('server exception $e');
    }
  }
}
