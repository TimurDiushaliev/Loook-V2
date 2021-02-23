import 'package:flutter/material.dart';
import 'package:loook/styles/style.dart';
import 'package:loook/widgets/ads/ads.dart';

class AdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            decoration: Style.searchInput,
          ),
          actions: [
            //filter button
          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: [
              Text('clock', style: TextStyle(color: Colors.black)),
              Text('clock', style: TextStyle(color: Colors.black)),
              Text('clock', style: TextStyle(color: Colors.black)),
              Text('clock', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Ads(),
            Center(child: Text('2')),
            Center(child: Text('3')),
            Center(child: Text('4')),
          ],
        ),
      ),
    );
  }
}
