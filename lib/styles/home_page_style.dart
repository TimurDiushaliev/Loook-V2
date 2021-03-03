import 'package:flutter/material.dart';

class HomePageStyle {
  static final bottomSheetStyle = BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)));
  static final categoriesTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  static final descriptionTextStyle =
      TextStyle(color: Colors.grey[500], fontSize: 13);
  static final priceStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  static final chooseTextButtonStyle = TextStyle(color: Colors.grey[600]);
}
