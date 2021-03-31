import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class UploadAdvertProvider {
  static uploadAdvert(Map<dynamic, dynamic> body) async {
    final String baseUrl = 'http://192.168.88.208/';
    final String apiUrl = 'api/v1/ads/';
    final String refreshTokenUrl = 'api/v1/login/refresh/';
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${Hive.box('tokensBox').get('accessToken')}',
    };
    try {
      print(1);
      final uri = Uri.parse(baseUrl + apiUrl);
      print(2);
      final request = http.MultipartRequest('POST', uri);
      print(3);
      for (var file in body['images']) {
        String fileName = file.path.split("/").last;
        print(4);
        var stream = http.ByteStream(DelegatingStream(file.openRead()));
        print(5);
        // get file length

        var length = await file.length(); //imageFile is your image file
        print(6);
        // multipart that takes file
        var multipartFileSign =
            http.MultipartFile('images', stream, length, filename: fileName);
        print(7);
        request.files.add(multipartFileSign);
      }
      print(8);
      request.headers.addAll(headers);
      print(9);
      body.remove('images');
      print(10);
      body['fields'] = body['fields'].toString();
      var fieldsJson = Map<String, String>.from(body);
      fieldsJson['fields'] = jsonEncode(fieldsJson['fields']);
      print(fieldsJson);
      print(11);
      request.fields.addAll(fieldsJson);
      print(12);
      var response = await request.send();
      print(13);
      response.stream.transform(utf8.decoder).listen(
        (value) async {
          print('response $value');
          print('status code ${response.statusCode}');
          if (response.statusCode == 401) {
            //TODO: refresh token
            print(14);
            try {
              if (Hive.box('tokensBox').get('refreshToken') != null) {
                var refreshTokenResponse = await http
                    .post(Uri.http('192.168.88.208', refreshTokenUrl), body: {
                  'refresh': Hive.box('tokensBox').get('refreshToken')
                });
                var tokens = jsonDecode(refreshTokenResponse.body);
                Hive.box('tokensBox')
                  ..put('accessToken', tokens['access'])
                  ..put('refreshToken', tokens['refresh']);
              }
            } catch (e) {
              print('refresh token exception $e');
            }
          }
        },
      );
    } catch (_) {
      print('$_');
    }
  }
}
