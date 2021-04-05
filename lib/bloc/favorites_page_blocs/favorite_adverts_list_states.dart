import 'package:flutter/cupertino.dart';

abstract class FavoriteAdvertsListStates {}

class AdvertLikedState extends FavoriteAdvertsListStates {
  int index;
  AdvertLikedState({@required this.index});
}

class AdvertNotLikedState extends FavoriteAdvertsListStates {}

class FavoriteAdvertsListFetchedState extends FavoriteAdvertsListStates {
  List<dynamic> favoriteAdverts;
  FavoriteAdvertsListFetchedState({@required this.favoriteAdverts}) : assert(favoriteAdverts!=null);
}
