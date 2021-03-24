import 'dart:convert';

import 'package:http/http.dart' as http;

class AdvertsListProvider {
  static fetchAdvertsList() async {
    final String baseUrl = '192.168.88.208:8000';
    final String apiUrl = 'api/v1/ads/';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final response =
        await http.get(Uri.http(baseUrl, apiUrl), headers: headers);
    print('${response.statusCode}');
    print('adverts list response ${jsonDecode(response.body)}');
  }
}
