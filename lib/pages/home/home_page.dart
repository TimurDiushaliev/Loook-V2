import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/values/strings.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/floating_action_buttom/add_advert_action_button.dart';
import 'package:loook/widgets/home_page/categories_tab_bar.dart';
import 'package:loook/widgets/home_page/home_bottom_sheet.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page/gold_ads.dart';
import 'package:loook/widgets/home_page/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firstItemSelected = FirstItemSelectedState();
    final _withRoundedCorners = WithRoundedCornersState();
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: DefaultTabController(
        length: Strings.categoriesList.length,
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
              preferredSize:
                  Size.fromHeight(MediaQuerySize.height(context) * 0.065),
              child: CategoriesTabBar(),
            ),
          ),
          body: Stack(
            children: [
              BlocProvider(
                  create: (context) => IndicatorBloc(_firstItemSelected),
                  child: GoldAds()),
              BlocProvider(
                  create: (context) => BottomSheetBloc(_withRoundedCorners),
                  child: HomeBottomSheet()),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: AddAdvertActionButton(),
          bottomNavigationBar: BottomAppBarNavigation(),
        ),
      ),
    );
  }
}
