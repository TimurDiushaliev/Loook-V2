import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/nav_bar/nav_bar_bloc.dart';
import 'package:loook/bloc/nav_bar/nav_bar_states.dart';
import 'package:loook/pages/ads.dart';

import 'bloc/nav_bar/nav_bar_events.dart';

void main() => runApp(
      BlocProvider<NavBarBloc>(
        create: (context) {
          final adsPage = AdsPageState();
          return NavBarBloc(adsPage);
        },
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navBar = BlocProvider.of<NavBarBloc>(context);
    return MaterialApp(
        home: Scaffold(
      body: BlocBuilder<NavBarBloc, NavBarState>(builder: (context, state) {
        if (state is AdsPageState) return AdsPage();
        if (state is FavoritesPageState)
          return Center(
            child: Text('Favorites'),
          );
        if (state is ChatPageState) return Center(child: Text('Chat'));
        if (state is ProfilePageState) return Center(child: Text('Profile'));
        return Center(child: CircularProgressIndicator());
      }),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index == 0) navBar.add(AdsPageEvent());
            if (index == 1) navBar.add(FavoritesPageEvent());
            if (index == 2) navBar.add(ChatPageEvent());
            if (index == 3) navBar.add(ProfilePageEvent());
          },
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Избранное'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чат'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded), label: 'Профиль'),
          ]),
    ));
  }
}
