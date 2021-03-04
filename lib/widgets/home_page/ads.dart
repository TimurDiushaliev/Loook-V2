import 'package:flutter/material.dart';
import 'package:loook/pages/info_page.dart';
import 'package:loook/styles/home_page_style.dart';

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoPage()));
                  },
                  child: Card(
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
                ),
                Container(
                  margin: EdgeInsets.all(_height * 0.02),
                  width: _width * 0.25,
                  child: Text(
                    'Продаю часы от Apple оптом дешевле',
                    textAlign: TextAlign.center,
                    style: HomePageStyle.descriptionTextStyle,
                  ),
                ),
                Container(
                  child: Text(
                    '399 KGS',
                    style: HomePageStyle.priceStyle,
                  ),
                )
              ],
            );
          }),
    );
  }
}