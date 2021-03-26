import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loook/models/adverts_list_model.dart';

class AdvertsListProvider {
  static Future<List<dynamic>> fetchAdvertsList() async {
    final String baseUrl = '192.168.88.208';
    final String apiUrl = 'api/v1/ads/';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final response =
        await http.get(Uri.http(baseUrl, apiUrl), headers: headers);
    List<dynamic> adverts = jsonDecode(response.body);
    return adverts.map((json) => AdvertsListModel.fromJson(json)).toList();
  }
}
