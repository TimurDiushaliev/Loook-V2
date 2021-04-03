import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class OnModerationAdvertImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [],
      options: CarouselOptions(
        height: ResponsiveSizeProvider.height(context) * 0.4,
        enableInfiniteScroll: false,
        viewportFraction: 1,
      ),
    );
  }
}
