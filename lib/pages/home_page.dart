import 'package:flutter/material.dart';
import 'package:loook/widgets/home_page/ads.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page/gold_ads.dart';
import 'package:loook/widgets/home_page/search.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Search(),
            Filter(),
          ],
        ),
        body: Stack(
          children: [
            GoldAds(),
            Ads(),
          ],
        ),
      ),
    );
  }
}
