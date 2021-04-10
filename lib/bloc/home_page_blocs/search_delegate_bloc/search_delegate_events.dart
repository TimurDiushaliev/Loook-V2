import 'package:flutter/cupertino.dart';

abstract class SearchDelegateEvents {}

class FetchAdvertsViaQueryEvent extends SearchDelegateEvents {
  String query;
  int offset;
  FetchAdvertsViaQueryEvent({@required this.query, @required this.offset});
}

class FetchNextAdvertsViaQueryEvent extends SearchDelegateEvents {}

class LikeAdvertBySearchDelegateEvent extends SearchDelegateEvents {}
