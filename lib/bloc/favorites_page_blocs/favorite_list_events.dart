import 'package:flutter/cupertino.dart';

abstract class FavoriteListEvents {}

class AdvertNotLikedEvent extends FavoriteListEvents {}

class AdvertLikedEvent extends FavoriteListEvents {
  int index;
  AdvertLikedEvent({@required this.index});
}
