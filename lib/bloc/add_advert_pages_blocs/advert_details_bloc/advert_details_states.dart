import 'package:flutter/foundation.dart';

abstract class AdvertDetailsStates {}

class AdvertAddedState extends AdvertDetailsStates {}

class CurrencyChangedState extends AdvertDetailsStates {
  String currency;
  CurrencyChangedState({@required this.currency});
}

class AdvertDetailsIsEmptyState extends AdvertDetailsStates {}
