import 'package:flutter/cupertino.dart';

abstract class SearchDelegateStates {}

class AdvertsViaSearchDelegateFetchedState extends SearchDelegateStates {
  List<dynamic> searchDelegateResultsList = [];
  AdvertsViaSearchDelegateFetchedState({@required this.searchDelegateResultsList});
}

class SearchDelegateFetchingErrorState extends SearchDelegateStates {}

class AdvertsViaSearchDelegateNotFetchedState extends SearchDelegateStates {}

class AdvertsViaSearchDelegateTokenNotValidState extends SearchDelegateStates {}

class AdvertsViaSearchDelegateIsEmptyState extends SearchDelegateStates {}
