import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_app_bar/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar/bottom_app_bar_events.dart';

class BottomAppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    BottomAppBarBloc bottomAppBarBloc = BlocProvider.of(context);
    return BottomAppBar(
      color: Colors.black87,
      shape: CircularNotchedRectangle(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: _width * 0.001),
            IconButton(
                icon: Icon(Icons.home, color: Colors.grey[500]),
                onPressed: () {
                  bottomAppBarBloc.add(HomePageEvent());
                }),
            IconButton(
                icon: Icon(Icons.favorite, color: Colors.grey[500]),
                onPressed: () {}),
            SizedBox(width: _width * 0.2),
            IconButton(
                icon: Icon(Icons.message, color: Colors.grey[500]),
                onPressed: () {
                  bottomAppBarBloc.add(ChatPageEvent());
                }),
            IconButton(
                icon: Icon(Icons.account_circle, color: Colors.grey[500]),
                onPressed: () {}),
            SizedBox(width: _width * 0.001),
          ],
        ),
      ),
    );
  }
}
