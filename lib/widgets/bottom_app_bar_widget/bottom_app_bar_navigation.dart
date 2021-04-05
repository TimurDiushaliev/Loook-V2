import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class BottomAppBarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BottomAppBarBloc _bottomAppBarBloc = BlocProvider.of<BottomAppBarBloc>(context);
    return Container(
      height: ResponsiveSizeProvider.height(context) * 0.075,
      child: BottomAppBar(
        color: Colors.black87,
        shape: CircularNotchedRectangle(),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: ResponsiveSizeProvider.width(context) * 0.001),
              IconButton(
                  icon: Icon(Icons.home, color: Colors.grey[500]),
                  onPressed: () {
                    _bottomAppBarBloc.add(HomePageEvent());
                  }),
              IconButton(
                  icon: Icon(Icons.favorite, color: Colors.grey[500]),
                  onPressed: () {
                    _bottomAppBarBloc.add(FavoritesPageEvent());
                  }),
              SizedBox(width: ResponsiveSizeProvider.width(context) * 0.2),
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
              SizedBox(width: ResponsiveSizeProvider.width(context) * 0.001),
            ],
          ),
        ),
      ),
    );
  }
}
