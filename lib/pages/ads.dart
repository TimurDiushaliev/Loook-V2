import 'package:flutter/material.dart';
import 'package:loook/styles/style.dart';
import 'package:loook/widgets/ads/ads.dart';

class AdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: 50,
                        width: 270,
                        margin: EdgeInsets.only(top: 30),
                        child: TextField(decoration: Style.searchInput)),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: IconButton(
                          icon: Icon(
                            Icons.filter_alt,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
                Expanded(
                  child: TabBar(
                    indicatorColor: Colors.black,
                    tabs: [
                      Text('tab', style: TextStyle(color: Colors.black)),
                      Text('tab', style: TextStyle(color: Colors.black)),
                      Text('tab', style: TextStyle(color: Colors.black)),
                      Text('tab', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
