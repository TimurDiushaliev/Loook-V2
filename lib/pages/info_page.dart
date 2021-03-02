import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/info_page/images.dart';
import 'package:loook/widgets/info_page/modal_bottom_sheet.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Loook',
            style: TextStyle(letterSpacing: 6),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Filter(),
          ],
        ),
        body: Stack(
          children: [
            InfoImages(),
            DescriptionModalBottomSheet(),
          ],
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.phone,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.green,
              labelBackgroundColor: Colors.green,
              label: '0779151515',
              child: Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            SpeedDialChild(
              backgroundColor: Colors.blue,
              labelBackgroundColor: Colors.blue,
              label: '0709151515',
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
            SpeedDialChild(
              backgroundColor: Colors.red,
              labelBackgroundColor: Colors.red,
              label: '0555151515',
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
