import 'package:flutter/cupertino.dart';

abstract class FavoriteAdvertsListEvents {}

class AdvertNotLikedEvent extends FavoriteAdvertsListEvents {}

class AdvertLikedEvent extends FavoriteAdvertsListEvents {
  int index;
  int id;
  AdvertLikedEvent({@required this.index, @required this.id});
}

class FetchFavoriteAdvertsListEvent extends FavoriteAdvertsListEvents {}
