import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_evets.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_events.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/services/sign_out_controller.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_balance.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_bottom_sheet.dart';
import 'package:loook/widgets/account_page_widgets/account_page/account_information.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/navigate_to_add_advert_pages_button/navigate_to_add_advert_pages_button.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final List<String> popUpMenuList = ['Редактировать', 'Выйти'];

  @override
  void initState() {
    AccountAdvertsBloc _accountAdvertsBloc =
        BlocProvider.of<AccountAdvertsBloc>(context)
          ..add(FetchAccountAdvertsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
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
                SignOutController.signOut();
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
        floatingActionButton: NavigateToAddAdvertPages(),
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
