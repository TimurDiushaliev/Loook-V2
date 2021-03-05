import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_actions.dart';
import 'package:loook/widgets/home_page/categories_tab_bar.dart';
import 'package:loook/widgets/home_page/home_bottom_sheet.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page/gold_ads.dart';
import 'package:loook/widgets/home_page/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kTextTabBarHeight;
    final _firstItemSelected = FirstItemSelectedState();
    final _withRoundedCorners = WithRoundedCornersState();
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          extendBody: true,
          drawer: Drawer(),
          appBar: AppBar(
            title: Text(
              'Loook',
              style: TextStyle(letterSpacing: 6),
            ),
            centerTitle: true,
            actions: [
              SearchIcon(),
              Filter(),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(_height * 0.065),
              child: CategoriesTabBar(),
            ),
          ),
          body: Stack(
            children: [
              BlocProvider(
                  create: (context) => IndicatorBloc(_firstItemSelected),
                  child: GoldAds()),
              BlocProvider(create: (context)=> BottomSheetBloc(_withRoundedCorners),child: HomeBottomSheet()),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {}),
          bottomNavigationBar: BottomAppBarActions(),
        ),
      ),
    );
  }
}
