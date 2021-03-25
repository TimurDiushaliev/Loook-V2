import 'package:flutter/foundation.dart';

abstract class AdvertsListStates {}

class AdvertsListFetchedState extends AdvertsListStates {
  List< dynamic> adverts;
  AdvertsListFetchedState({@required this.adverts});
}

class AdvertsListIsNotFetchedState extends AdvertsListStates {}

class FetchingAdvertsListFailed extends AdvertsListStates {}
