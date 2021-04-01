import 'package:flutter/foundation.dart';

abstract class AdvertDetailsEvents {}

class AddDetailEvent extends AdvertDetailsEvents {
  Map<dynamic, dynamic> advertDetail;
  AddDetailEvent({@required this.advertDetail});
}

class AddImageListEvent extends AdvertDetailsEvents {
  List<dynamic> imageList = [];
  AddImageListEvent({@required this.imageList});
}

class ChangeCurrencyEvent extends AdvertDetailsEvents {
  String currency;
  ChangeCurrencyEvent({@required this.currency});
}

class UploadAdvertEvent extends AdvertDetailsEvents {}

class FetchCategoriesListEvent extends AdvertDetailsEvents {}

class FetchSubCategoriesListEvent extends AdvertDetailsEvents {
  int categoryIndex;
  FetchSubCategoriesListEvent({@required this.categoryIndex});
}

class FetchCategoryDetailsEvent extends AdvertDetailsEvents {
  int subCategoryIndex;
  FetchCategoryDetailsEvent({@required this.subCategoryIndex});
}

class FetchNextCategoryDetailsEvent extends AdvertDetailsEvents {}

class FetchPreviousCategoryDetailsEvent extends AdvertDetailsEvents {}
