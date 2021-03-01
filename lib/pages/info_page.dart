import 'package:flutter/material.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/info_page/info_images.dart';
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
          Filter(),
        ],
      ),
      body: Stack(
        children: [
          InfoImages(),
          DescriptionModalBottomSheet(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite, color: Colors.red),
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
