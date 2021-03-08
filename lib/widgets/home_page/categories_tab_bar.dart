import 'package:flutter/material.dart';
import 'package:loook/values/widgets.dart';

class CategoriesTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: (index) {
          print(index.toString());
        },
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        indicatorColor: Colors.red,
        tabs: Widgets.tabs);
  }
}
