import 'package:flutter/cupertino.dart';
import 'package:loook/models/adverts_list_model.dart';

abstract class AdvertByIdStates{}

class AdvertByIdFetchedState extends AdvertByIdStates{
  AdvertsModel advertById;
  AdvertByIdFetchedState({@required this.advertById});
}

class AdvertByIdFetchingErrorState extends AdvertByIdStates{}

class AdvertByIdNotFetchedState extends AdvertByIdStates{}