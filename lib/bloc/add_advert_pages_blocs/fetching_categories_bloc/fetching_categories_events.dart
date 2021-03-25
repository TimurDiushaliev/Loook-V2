import 'package:flutter/foundation.dart';

abstract class FetchingCategoriesEvents {}

class FetchCategoriesListEvent extends FetchingCategoriesEvents {}

class FetchSubCategoriesListEvent extends FetchingCategoriesEvents {
  int index;
  FetchSubCategoriesListEvent({@required this.index});
}

class FetchingCategoriesDetailsEvent extends FetchingCategoriesEvents {
  int index;
  FetchingCategoriesDetailsEvent({@required this.index});
}
