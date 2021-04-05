import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_evets.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_events.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/services/authentification_provider.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_balance.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_bottom_sheet.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_information.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/main_floating_action_button/main_floating_action_button.dart';

class UserPage extends StatelessWidget {
  final List<String> popUpMenuList = ['Редактировать', 'Выйти'];

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    AccountAdvertsBloc _accountAdvertsBloc =
        BlocProvider.of<AccountAdvertsBloc>(context)
          ..add(FetchAccountAdvertsEvent());
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: AppBarTitle(),
          centerTitle: true,
          actions: [
            PopupMenuButton(onSelected: (value) {
              if (value == 'Выйти') {
                AuthenticationProvider.signOut();
                _authenticationBloc.add(SignOutEvent());
              }
            }, itemBuilder: (context) {
              return popUpMenuList
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList();
            })
          ],
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
        floatingActionButton: MainFloatingActionButton(),
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
