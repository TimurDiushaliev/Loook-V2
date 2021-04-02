import 'package:hive/hive.dart';

class ApiEndpoints {
  static const String baseUrl = '192.168.88.208';
  static final Map<String, String> headersWithToken = {
    'Content-type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${Hive.box('tokensBox').get('accessToken')}',
  };
  static const Map<String, String> headersWithNoTokens = {
    'Content-type': 'application/json; charset=UTF-8',
  };
  static const String adsApiUrl = 'api/v1/ads/';
  static const String refreshTokenUrl = 'api/v1/login/refresh/';
  static const String registerApiUrl = 'api/v1/register/';
  static const String loginApiUrl = 'api/v1/login/';
  static const String categoriesApiUrl = 'api/v1/category/list';
  static const String accountAdsApiUrl = 'api/v1/me/ads/';
  static const String favoritesApiUrl = 'api/v1/ads/favorites/';
  static const String advertByIdApiUrl = 'api/v1/ads/';
}
