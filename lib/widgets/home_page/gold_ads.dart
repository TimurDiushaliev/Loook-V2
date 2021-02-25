import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GoldAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final String goldImage1 = 'images/gold_ad.png';
    final String goldImage2 = 'images/gold_ad2.png';
    return Stack(
      children: [
        CarouselSlider(
          items: [
            Image.asset(goldImage1),
            Image.asset(goldImage2),
          ],
          options: CarouselOptions(
            height: _height * 0.35,
            enableInfiniteScroll: false,
            autoPlay: true,
            viewportFraction: 1,
          ),
        ),
      ],
    );
  }
}
