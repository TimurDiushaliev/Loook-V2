import 'package:flutter/material.dart';
import 'package:loook/values/strings.dart';

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
        tabs: Strings.categoriesList
            .map((e) => Tab(
                  text: e,
                ))
            .toList());
  }
}
