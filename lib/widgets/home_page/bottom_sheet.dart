import 'package:flutter/material.dart';
import 'package:loook/styles/ads.dart';
import 'package:loook/widgets/home_page/ads.dart';

class ModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            decoration: AdsStyle.bottomSheetStyle,
            child: ListView.builder(
                itemCount: 4,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Container(
                    height: _height * 0.55,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: _width * 0.05,
                                  top: _height * 0.03,
                                  bottom: _height * 0.03),
                              child: Text('Категории',
                                  style: AdsStyle.categoriesTextStyle),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: _width * 0.08),
                              child: Text(
                                'Выбрать',
                                style: AdsStyle.chooseTextButtonStyle,
                              ),
                            )
                          ],
                        ),
                        Ads(),
                        Divider(
                          thickness: 2,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
