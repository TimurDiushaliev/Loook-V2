import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class UploadAdvertProvider {
  static uploadAdvert(Map<dynamic, dynamic> body) async {
    final String baseUrl = 'http://192.168.88.208:8000/';
    final String apiUrl = 'api/v1/ads/';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${Hive.box('tokensBox').get('accessToken')}',
    };
    try {
      final uri = Uri.parse(baseUrl + apiUrl);

      final request = http.MultipartRequest('POST', uri);

      for (var file in body['images']) {
        String fileName = file.path.split("/").last;

        var stream = http.ByteStream(DelegatingStream(file.openRead()));

        // get file length

        var length = await file.length(); //imageFile is your image file

        // multipart that takes file
        var multipartFileSign =
            http.MultipartFile('images', stream, length, filename: fileName);

        request.files.add(multipartFileSign);
      }

      request.headers.addAll(headers);

      body.remove('images');

      var a = Map<String, String>.from(body);
      request.fields.addAll(a);

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        print('response $value');
        print('status code ${response.statusCode}');
      });
    } catch (_) {
      print('$_');
    }
  }
}
