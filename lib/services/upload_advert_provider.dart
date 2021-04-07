import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:loook/services/api_endpoints.dart';
import 'package:loook/services/token_refresher.dart';

class UploadAdvertProvider {
  static Future<String> uploadAdvert(
      Map<dynamic, dynamic> body, List<dynamic> imageList) async {
    try {
      final uri = Uri.parse(
          'http://' + ApiEndpoints.baseUrl + '/' + ApiEndpoints.adsApiUrl);
      final request = http.MultipartRequest('POST', uri);
      for (var file in imageList) {
        String fileName = file.path.split("/").last;
        var stream = http.ByteStream(DelegatingStream(file.openRead()));
        // get file length
        var length = await file.length(); //imageFile is your image file
        // multipart that takes file
        var multipartFileSign =
            http.MultipartFile('images', stream, length, filename: fileName);
        request.files.add(multipartFileSign);
      }
      request.headers.addAll(ApiEndpoints.headersWithTokens);
      print(1);
      if (body['fields'] != null) {
        body['fields'] = jsonEncode(body['fields']);
      }
      print(body['fields'].runtimeType);
      var fieldsJson = Map<String, String>.from(body);
      print(3);
      // fieldsJson['fields'] = jsonEncode(body['fields']);
      print(4);
      request.fields.addAll(fieldsJson);
      print('${request.fields}');
      var response = await request.send();
      http.Response.fromStream(response)
          .then((value) => print(jsonDecode(value.body)));
      if (response.statusCode == 201) {
        return 'Объявление опубликовано!';
      } else if (response.statusCode == 401) {
        await TokenRefreher.refreshToken();
        uploadAdvert(body, imageList);
      } else {
        return 'Возникла ошибка, объявление не опубликовано!';
      }
    } catch (_) {
      print('upload advert exception$_');
      return 'Возникла ошибка, объявление не опубликовано!';
    }
    return '';
  }
}
