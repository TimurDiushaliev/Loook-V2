import 'package:flutter/foundation.dart';

abstract class AdvertDetailsEvents{}

class AddDetailEvent extends AdvertDetailsEvents {
  Map<dynamic, dynamic> advertDetail;
  AddDetailEvent({@required this.advertDetail});
}

class ChangeCurrencyEvent extends AdvertDetailsEvents {
  String currency;
  ChangeCurrencyEvent({@required this.currency});
}

class UploadAdvertEvent extends AdvertDetailsEvents {}