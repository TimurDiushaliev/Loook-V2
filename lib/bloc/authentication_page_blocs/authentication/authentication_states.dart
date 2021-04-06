import 'package:flutter/cupertino.dart';

abstract class AuthenticationStates {}

class SignInUserState extends AuthenticationStates {
  String userState;
  SignInUserState({@required this.userState});
}

class SignUpUserState extends AuthenticationStates {
  String userState;
  SignUpUserState({@required this.userState});
}

class AuthenticationErrorState extends AuthenticationStates {}

class NotAuthenticatedState extends AuthenticationStates {}
