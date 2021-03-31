import 'package:flutter/foundation.dart';

abstract class ChosedDetailsStates {}

class ChosedDetailsListState extends ChosedDetailsStates {
  List<dynamic> chosedDetailsList = [];
  ChosedDetailsListState({@required this.chosedDetailsList});
}

class DetailsNotChosedState extends ChosedDetailsStates {}
