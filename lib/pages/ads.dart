import 'package:flutter/material.dart';
import 'package:loook/values/strings.dart';

class AdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Strings.categories.length,
      child: Scaffold(
        appBar: AppBar(
            title: TextField(),
            actions: [
              //filter button
            ],
            bottom: TabBar(
                isScrollable: true,
                tabs: Strings.categories.map((e) => Tab(text: e)).toList())),
        body: TabBarView(
          children:
              Strings.categories.map((e) => Center(child: Text(e))).toList(),
        ),
      ),
    );
  }
}
