import 'package:flutter/cupertino.dart';
import 'package:loook/models/categories_details_model.dart';

abstract class FetchingCategoriesStates {}

class CategoriesListFetchedState extends FetchingCategoriesStates {
  List<AdvertDetailsModel> categoriesDetailsList;
  CategoriesListFetchedState({@required this.categoriesDetailsList})
      : assert(categoriesDetailsList != null);
}

class SubCategoriesListFetchedState extends FetchingCategoriesStates {
  List<dynamic> subCategoriesDetailsList;
  SubCategoriesListFetchedState({@required this.subCategoriesDetailsList})
      : assert(subCategoriesDetailsList != null);
}

class CategoriesDetailsIsNotFetchedState extends FetchingCategoriesStates {}

class CategoryDetailsFetchedState extends FetchingCategoriesStates {
  Map<String, dynamic> categoryDetailsMap = {};
  CategoryDetailsFetchedState({@required this.categoryDetailsMap});
}
