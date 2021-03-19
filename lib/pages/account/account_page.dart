import 'package:flutter/material.dart';
import 'package:loook/pages/account/authentication/authentication_page.dart';
import 'package:loook/repository/authentication_repository.dart';
import 'package:loook/widgets/account_page/account_balance.dart';
import 'package:loook/widgets/account_page/account_bottom_sheet.dart';
import 'package:loook/widgets/account_page/account_information.dart';
import 'package:loook/widgets/add_advert_action_button_button/add_advert_action_button.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_navigation.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: AuthenticationRepository.accesToken != null
          ? Scaffold(
              extendBody: true,
              appBar: AppBar(
                title: AppBarTitle(),
                centerTitle: true,
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
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: AddAdvertActionButton(),
              bottomNavigationBar: BottomAppBarNavigation(),
            )
          : AuthenticationPage(),
    );
  }
}
