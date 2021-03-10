import 'package:flutter/material.dart';
import 'package:loook/widgets/account_page/account_balance.dart';
import 'package:loook/widgets/account_page/account_bottom_sheet.dart';
import 'package:loook/widgets/account_page/account_information.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/floating_action_button/add_advert_action_button.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                AccountInformation(),
                AccountBalance(),
              ],
            ),
            AccountBottomSheet()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AddAdvertActionButton(),
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
