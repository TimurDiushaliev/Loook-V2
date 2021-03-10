import 'package:flutter/cupertino.dart';

abstract class FavoriteListStates {}

class AdvertLikedState extends FavoriteListStates {
  int index;
  AdvertLikedState({@required this.index});
}

class AdvertNotLikedState extends FavoriteListStates {}
