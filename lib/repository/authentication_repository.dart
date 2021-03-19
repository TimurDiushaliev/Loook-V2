import 'package:hive/hive.dart';

class AuthenticationRepository {
  static get accesToken {
    Box<dynamic> box = Hive.box('tokensBox');
    return box.get('accessToken');
  }

  static get refreshToken {
    Box<dynamic> box = Hive.box('tokensBox');
    return box.get('refreshToken');
  }
}
