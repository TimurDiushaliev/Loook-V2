import 'package:flutter/material.dart';

class AdvertDetailsPageStyle {
  static final bottomSheetStyleWithRoundedCorners = BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)));
  static final bottomSheetStyleWithUsualCorners = BoxDecoration(
    color: Colors.grey[200],
  );
}
