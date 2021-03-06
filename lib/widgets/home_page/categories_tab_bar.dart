import 'package:flutter/material.dart';
import 'package:loook/values/strings.dart';

class CategoriesTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs =
        Strings.categoriesList.map((e) => Tab(text: e)).toList();
    return TabBar(
        onTap: (index) {
          print(index.toString());
        },
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        indicatorColor: Colors.red,
        tabs: tabs);
  }
}
