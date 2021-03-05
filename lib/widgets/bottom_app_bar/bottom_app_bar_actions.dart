import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_events.dart';

class BottomAppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;
    BottomAppBarBloc _bottomAppBarBloc = BlocProvider.of(context);
    return Container(
      height: _height * 0.075,
      child: BottomAppBar(
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
                    _bottomAppBarBloc.add(HomePageEvent());
                  }),
              IconButton(
                  icon: Icon(Icons.favorite, color: Colors.grey[500]),
                  onPressed: () {}),
              SizedBox(width: _width * 0.2),
              IconButton(
                  icon: Icon(Icons.message, color: Colors.grey[500]),
                  onPressed: () {
                    _bottomAppBarBloc.add(ChatPageEvent());
                  }),
              IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.grey[500]),
                  onPressed: () {
                    _bottomAppBarBloc.add(AccountPageEvent());
                  }),
              SizedBox(width: _width * 0.001),
            ],
          ),
        ),
      ),
    );
  }
}
