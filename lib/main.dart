import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_states.dart';
import 'package:loook/pages/chat/chat_page.dart';
import 'package:loook/pages/home/home_page.dart';
import 'package:loook/pages/account/account_page.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homePageState = HomePageState();
    return BlocProvider(
      create: (context) => BottomAppBarBloc(_homePageState),
      child: BlocBuilder<BottomAppBarBloc, BottomAppBarStates>(
        builder: (context, state) {
          if (state is HomePageState) return HomePage();
          if (state is ChatPageState) return ChatPage();
          if (state is AccountPageState) return AccountPage();
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
