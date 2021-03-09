import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class InfoImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _imgList = [
      'images/gold_ads/gold_ad.png',
      'images/gold_ads/gold_ad2.png'
    ];
    return Stack(
      children: [
        CarouselSlider(
          items: [
            Image.asset('images/gold_ads/gold_ad.png'),
            Image.asset('images/gold_ads/gold_ad2.png'),
          ],
          options: CarouselOptions(
            height: _height * 0.35,
            enableInfiniteScroll: false,
            viewportFraction: 1,
          ),
        ),
      ],
    );
  }
}
