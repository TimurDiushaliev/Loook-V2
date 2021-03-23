import 'package:flutter/cupertino.dart';
import 'package:loook/models/advert_details_model.dart';
import 'package:loook/models/categories_details_model.dart';

abstract class AdvertDetailsStates {}

class CategoriesListFetchedState extends AdvertDetailsStates {
  List<AdvertDetailsModel> categoriesDetailsList;
  CategoriesListFetchedState({@required this.categoriesDetailsList})
      : assert(categoriesDetailsList != null);
}

class SubCategoriesListFetchedState extends AdvertDetailsStates {
  List<AdvertDetailsModel> categoriesDetailsList;
  SubCategoriesListFetchedState({@required this.categoriesDetailsList})
      : assert(categoriesDetailsList != null);
}

class AddMediaPageState extends AdvertDetailsStates {}

class AddDescriptionPageState extends AdvertDetailsStates {}

class AddPricePageState extends AdvertDetailsStates {}

class CategoriesDetailsIsNotFetchedState extends AdvertDetailsStates {}

class AdvertAddedState extends AdvertDetailsStates {}
