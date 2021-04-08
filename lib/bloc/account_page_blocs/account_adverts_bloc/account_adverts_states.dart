import 'package:flutter/cupertino.dart';

abstract class AccountAdvertsStates {}

class AccountAdvertsFetchedState extends AccountAdvertsStates {
  List<dynamic> accountAdverts = [];
  AccountAdvertsFetchedState({@required this.accountAdverts});
}

class AccountAdvertsNotFetchedState extends AccountAdvertsStates {}

class TokenRefreshedState extends AccountAdvertsStates {}

class FetchingAccountAdvertsFailedState extends AccountAdvertsStates {}
