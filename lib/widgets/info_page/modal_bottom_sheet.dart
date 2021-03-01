import 'package:flutter/material.dart';
import 'package:loook/styles/home_page_style.dart';
import 'package:loook/styles/info_page_style.dart';

class DescriptionModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
            decoration: InfoPageStyle.bottomSheetStyle,
            child: ListView(
              controller: scrollController,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: _height * 0.02,
                      right: _width * 0.05,
                      left: _width * 0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.visibility_rounded,
                        color: Colors.grey[600],
                      ),
                      Text(
                        '13',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Text(
                  'Продам авто Запорожец 1982 года',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          );
        });
  }
}
