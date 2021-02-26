import 'package:flutter/material.dart';
import 'package:loook/styles/ads.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height * 0.4,
      child: ListView.separated(
          padding: EdgeInsets.only(left: _width * 0.05),
          separatorBuilder: (context, index) {
            return SizedBox(width: _width * 0.07);
          },
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  color: Colors.white,
                  child: Container(
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          child: Image.asset(
                            'images/watch.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(_height * 0.02),
                  width: _width * 0.25,
                  child: Text(
                    'Продаю часы от Apple оптом дешевле',
                    textAlign: TextAlign.center,
                    style: AdsStyle.descriptionTextStyle,
                  ),
                ),
                Container(
                  child: Text(
                    '399 KGS',
                    style: AdsStyle.priceStyle,
                  ),
                )
              ],
            );
          }),
    );
  }
}
