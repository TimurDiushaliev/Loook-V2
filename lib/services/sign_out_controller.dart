import 'package:hive/hive.dart';

class SignOutController {
  static signOut() {
    Hive.box('tokensBox')..delete('accessToken')..delete('refreshToken');
  }
}
