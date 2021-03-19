import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvents {}

class SignInEvent extends AuthenticationEvents {
  String username;
  String password;
  SignInEvent({@required this.username, @required this.password});
}

class SignUpEvent extends AuthenticationEvents {}
