import 'package:flutter/cupertino.dart';

abstract class AccountAdvertsStates {}

class AccountAdvertsFetchedState extends AccountAdvertsStates {
  List<dynamic> accountAdverts = [];
  AccountAdvertsFetchedState({@required this.accountAdverts})
      : assert(accountAdverts != null);
}

class AccountAdvertsNotFetchedState extends AccountAdvertsStates {}

class FetchingAccountAdvertsFailedState extends AccountAdvertsStates {}
