import 'package:flutter/foundation.dart';

abstract class AdvertDetailsEvents {}

class FetchCategoryDetailsEvent extends AdvertDetailsEvents {}

class FetchSubCategoriesListEvent extends AdvertDetailsEvents {}

class NavigateToAddMediaPageEvent extends AdvertDetailsEvents {}

class NavigateToAddDescriptionEvent extends AdvertDetailsEvents {}

class NavigateToAddPricePageEvent extends AdvertDetailsEvents {}

class AddDetailEvent extends AdvertDetailsEvents {
  Map<dynamic, dynamic> advertDetail;
  AddDetailEvent({@required this.advertDetail});
}
