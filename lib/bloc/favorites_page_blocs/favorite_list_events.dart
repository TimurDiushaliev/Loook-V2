import 'package:flutter/cupertino.dart';

abstract class FavoriteListEvents {}

class AdvertNotLikedEvent extends FavoriteListEvents {}

class AdvertLikedEvent extends FavoriteListEvents {
  int index;
  int id;
  AdvertLikedEvent({@required this.index, @required this.id});
}
