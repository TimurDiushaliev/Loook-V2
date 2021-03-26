import 'package:flutter/foundation.dart';

abstract class AdvertDetailsEvents{}

class AddDetailEvent extends AdvertDetailsEvents {
  Map<dynamic, dynamic> advertDetail;
  AddDetailEvent({@required this.advertDetail});
}

class ChangeCurrencyEvent extends AdvertDetailsEvents {
  String currency;
  ChangeCurrencyEvent({@required this.currency});
}

class UploadAdvertEvent extends AdvertDetailsEvents {}

class FetchCategoriesListEvent extends AdvertDetailsEvents {}

class FetchSubCategoriesListEvent extends AdvertDetailsEvents {
  int index;
  FetchSubCategoriesListEvent({@required this.index});
}

class FetchCategoryDetailsEvent extends AdvertDetailsEvents {
  int index;
  FetchCategoryDetailsEvent({@required this.index});
}