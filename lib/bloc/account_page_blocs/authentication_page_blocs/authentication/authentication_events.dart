import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvents {}

class SignInEvent extends AuthenticationEvents {
  String username;
  String password;
  SignInEvent({@required this.username, @required this.password});
}

class SignUpEvent extends AuthenticationEvents {
  String username;
  String password;
  String phoneNumber;
  SignUpEvent(
      {@required this.username,
      @required this.password,
      @required this.phoneNumber});
}

class SignOutEvent extends AuthenticationEvents {}
