import 'package:flutter/material.dart';
import 'package:loook/styles/info_page_style.dart';
import 'package:loook/widgets/info_page/description.dart';
import 'package:loook/widgets/info_page/information.dart';
import 'package:loook/widgets/info_page/title.dart';

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
            child: ListView.builder(
              itemCount: 1,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.02,
                            left: _width * 0.8,
                            right: _width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.visibility,
                              color: Colors.grey[700],
                            ),
                            Text(
                              '13',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      InfoTitle(),
                      InfoDescription(),
                      Information(),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
