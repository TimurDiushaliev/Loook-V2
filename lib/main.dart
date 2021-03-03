import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_blocs/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_blocs/bottom_app_bar_states.dart';
import 'package:loook/pages/chat_page.dart';
import 'package:loook/pages/home_page.dart';
import 'package:loook/pages/account_page.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_actions.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageState = HomePageState();
    return BlocProvider(
      create: (context) => BottomAppBarBloc(homePageState),
      child: Scaffold(
          extendBody: true,
          body: BlocBuilder<BottomAppBarBloc, BottomAppBarStates>(
            builder: (context, state) {
              if (state is HomePageState) return HomePage();
              if (state is ChatPageState) return ChatPage();
              if(state is AccountPageState) return AccountPage();
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
              onPressed: () {}),
          bottomNavigationBar: BottomAppBarActions()),
    );
  }
}
