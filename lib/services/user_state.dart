import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserState {
  static Widget checkUserToken(Widget page) {
    if (Hive.box('tokensBox').get('accessToken') != null) {
      return page;
    }
    throw Exception('user token is null');
  }
}
