import 'package:flutter/material.dart';
import 'package:loook/widgets/account_page/account_balance.dart';
import 'package:loook/widgets/account_page/account_bottom_sheet.dart';
import 'package:loook/widgets/account_page/account_information.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_actions.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {}),
          bottomNavigationBar: BottomAppBarActions(),
        ),
      ),
    );
  }
}
