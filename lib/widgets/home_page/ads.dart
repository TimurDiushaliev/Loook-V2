import 'package:flutter/material.dart';
import 'package:loook/pages/info_page.dart';
import 'package:loook/styles/home_page_style.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: _height * 0.03),
      height: _height * 0.4,
      child: ListView.separated(
          padding: EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
          separatorBuilder: (context, index) {
            return SizedBox(width: _width * 0.07);
          },
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InfoPage())),
                      child: Container(
                        height: _height * 0.3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/watch.png',
                              fit: BoxFit.contain,
                            )),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {})
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: _height * 0.03, bottom: _height * 0.02),
                  width: _width * 0.4,
                  height: _height * 0.05,
                  child: Text(
                    'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: HomePageStyle.descriptionTextStyle,
                  ),
                ),
                Container(
                  width: _width * 0.5,
                  child: Text(
                    '312 KGS',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: HomePageStyle.priceStyle,
                  ),
                )
              ],
            );
          }),
    );
  }
}
