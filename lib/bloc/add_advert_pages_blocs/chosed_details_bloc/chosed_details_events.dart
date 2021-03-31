import 'package:flutter/foundation.dart';

abstract class ChosedDetailsEvents {}

class DetailIsChosedEvent extends ChosedDetailsEvents {
  dynamic chosedDetail;
  DetailIsChosedEvent({@required this.chosedDetail});
}

class RemoveLastIndexOfChosedDetailsEvent extends ChosedDetailsEvents {}
