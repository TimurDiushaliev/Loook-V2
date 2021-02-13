import 'package:flutter/material.dart';
import 'package:loook/widgets/home_page/ads.dart';
import 'package:loook/widgets/home_page/categories.dart';
import 'package:loook/widgets/home_page/header.dart';
import 'package:loook/widgets/home_page/my_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Categories(),
          Ads(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
