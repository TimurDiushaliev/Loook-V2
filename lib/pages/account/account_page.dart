import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/pages/account/no_account_page.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_balance.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_bottom_sheet.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_information.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/navigate_to_add_advert_pages_button/navigate_to_add_advert_pages_button.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: BlocBuilder<AuthenticationBloc, AuthenticationStates>(
        builder: (context, state) {
          if (state is SignedInState) if (Hive.box('tokensBox')
                  .get('accessToken') !=
              null)
            return Scaffold(
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
              floatingActionButton: NavigateToAddAdvertPages(),
              bottomNavigationBar: BottomAppBarNavigation(),
            );
          return NoAccountPage();
        },
      ),
    );
  }
}
