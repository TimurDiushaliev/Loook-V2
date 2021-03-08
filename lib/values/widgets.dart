import 'package:flutter/material.dart';
import 'package:loook/values/strings.dart';

class Widgets {
  static final List<Widget> tabs =
      Strings.categoriesList.map((e) => Tab(text: e)).toList();
}
