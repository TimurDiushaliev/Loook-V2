import 'package:flutter/material.dart';
import 'package:loook/widgets/home_page/ads.dart';
import 'package:loook/widgets/home_page/categories.dart';
import 'package:loook/widgets/home_page/my_app_bar.dart';
import 'package:loook/widgets/home_page/my_bottom_navigation_bar.dart';
import 'package:loook/widgets/home_page/my_floating_action_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          Categories(),
          Ads(),
        ],
      ),
      floatingActionButton: MyFloatingActionButton(),
      bottomNavigationBar: MyBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
