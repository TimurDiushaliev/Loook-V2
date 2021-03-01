import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/indicator_bloc.dart';
import 'package:loook/widgets/home_page/modal_bottom_sheet.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page/gold_ads.dart';
import 'package:loook/widgets/home_page/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
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
              child: Visibility(
                visible: true,
                child: TabBar(indicatorColor: Colors.red, tabs: [
                  Tab(
                    text: 'Транспорт',
                  ),
                  Tab(
                    text: 'Недвижимость',
                  ),
                  Tab(
                    text: 'Одежда',
                  ),
                  Tab(
                    text: 'Техника',
                  )
                ]),
              ),
            ),
          ),
          body: Stack(
            children: [
              BlocProvider(
                  create: (context) => IndicatorBloc(Colors.white),
                  child: GoldAds()),
              ModalBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
