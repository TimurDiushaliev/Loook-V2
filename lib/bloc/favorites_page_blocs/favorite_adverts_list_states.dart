import 'package:flutter/cupertino.dart';

abstract class FavoriteAdvertsListStates {}

class AdvertLikedState extends FavoriteAdvertsListStates {
  int index;
  int categoryIndex;
  AdvertLikedState({@required this.index, @required this.categoryIndex});
}

class AdvertNotLikedState extends FavoriteAdvertsListStates {}

class FavoriteAdvertsListFetchedState extends FavoriteAdvertsListStates {
  List<dynamic> favoriteAdverts;
  FavoriteAdvertsListFetchedState({@required this.favoriteAdverts})
      : assert(favoriteAdverts != null);
}

class FavoriteAdvertsNotFetchedState extends FavoriteAdvertsListStates {
  //refresh token
}
