import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/home_page_widgets/home_page/home_bottom_sheet.dart';
import 'package:loook/widgets/home_page_widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page_widgets/home_page/gold_ads.dart';
import 'package:loook/widgets/home_page_widgets/home_page/search.dart';
import 'package:loook/widgets/main_floating_action_button/main_floating_action_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AdvertDetailsBloc>(context).add(FetchCategoriesListEvent());
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        extendBody: true,
        drawer: Drawer(),
        appBar: AppBar(
          title: AppBarTitle(),
          centerTitle: true,
          actions: [
            SearchIcon(),
            Filter(),
          ],
        ),
        body: Stack(
          children: [
            GoldAds(),
            HomeBottomSheet(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MainFloatingActionButton(),
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
