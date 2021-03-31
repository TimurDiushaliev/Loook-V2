import 'package:flutter/foundation.dart';
import 'package:loook/models/categories_details_model.dart';

abstract class AdvertDetailsStates {}

class AdvertAddedState extends AdvertDetailsStates {}

class CurrencyChangedState extends AdvertDetailsStates {
  String currency;
  CurrencyChangedState({@required this.currency});
}

class CategoriesListFetchedState extends AdvertDetailsStates {
  List<AdvertDetailsModel> categoriesDetailsList;
  CategoriesListFetchedState({@required this.categoriesDetailsList})
      : assert(categoriesDetailsList != null);
}

class SubCategoriesListFetchedState extends AdvertDetailsStates {
  List<dynamic> subCategoriesDetailsList;
  SubCategoriesListFetchedState({@required this.subCategoriesDetailsList})
      : assert(subCategoriesDetailsList != null);
}

class AdvertDetailsIsEmptyState extends AdvertDetailsStates {}

class CategoryDetailsFetchedState extends AdvertDetailsStates {
  Map<String, dynamic> categoryDetailsMap = {};
  String key;
  dynamic values;
  int keyIndex;
  CategoryDetailsFetchedState({
    @required this.categoryDetailsMap,
    @required this.key,
    @required this.values,
    @required this.keyIndex,
  });
}


