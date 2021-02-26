import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/indicator_bloc.dart';
import 'package:loook/widgets/home_page/bottom_sheet.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page/gold_ads.dart';
import 'package:loook/widgets/home_page/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            'Loook',
            style: TextStyle(letterSpacing: 6),
          ),
          centerTitle: true,
          actions: [
            Search(),
            Filter(),
          ],
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
    );
  }
}
