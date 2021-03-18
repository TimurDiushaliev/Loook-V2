import 'package:flutter/cupertino.dart';
import 'package:loook/models/categories_details_model.dart';

abstract class CategoriesDetailsStates {}

class CategorieDetailsState extends CategoriesDetailsStates {
  List<CategoriesDetailsModel> categoriesDetailsList;
  CategorieDetailsState({@required this.categoriesDetailsList})
      : assert(categoriesDetailsList != null);
}

class CategoriesDetailsIsNotFetchedState extends CategoriesDetailsStates {}
