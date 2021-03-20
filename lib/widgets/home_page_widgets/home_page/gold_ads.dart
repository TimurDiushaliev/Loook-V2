import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_events.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class GoldAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IndicatorBloc _indicatorBLoc = BlocProvider.of<IndicatorBloc>(context);
    final _imgList = [
      'images/gold_ads/gold_ad.png',
      'images/gold_ads/gold_ad2.png'
    ];
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider(
          items: [
            Image.asset(_imgList[0]),
            Image.asset(_imgList[1]),
          ],
          options: CarouselOptions(
              height: ResponsiveSizeProvider.height(context) * 0.4,
              enableInfiniteScroll: false,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                switch (index) {
                  case 0:
                    _indicatorBLoc.add(FirstItemSelectedEvent());
                    break;
                  case 1:
                    _indicatorBLoc.add(SecondItemSelectedEvent());
                    break;
                }
              }),
        ),
        Container(
            margin: EdgeInsets.only(
                left: ResponsiveSizeProvider.width(context) * 0.45,
                bottom: ResponsiveSizeProvider.height(context) * 0.05),
            child: BlocBuilder<IndicatorBloc, IndicatorStates>(
              builder: (context, state) {
                if (state is FirstItemSelectedState)
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ResponsiveSizeProvider.height(context) * 0.01,
                            horizontal:
                                ResponsiveSizeProvider.width(context) * 0.01),
                        width: ResponsiveSizeProvider.width(context) * 0.02,
                        height: ResponsiveSizeProvider.height(context) * 0.02,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ResponsiveSizeProvider.height(context) * 0.01,
                            horizontal:
                                ResponsiveSizeProvider.width(context) * 0.01),
                        width: ResponsiveSizeProvider.width(context) * 0.02,
                        height: ResponsiveSizeProvider.height(context) * 0.02,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                    ],
                  );
                if (state is SecondItemSelectedState)
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ResponsiveSizeProvider.height(context) * 0.01,
                            horizontal:
                                ResponsiveSizeProvider.width(context) * 0.01),
                        width: ResponsiveSizeProvider.width(context) * 0.02,
                        height: ResponsiveSizeProvider.height(context) * 0.02,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ResponsiveSizeProvider.height(context) * 0.01,
                            horizontal:
                                ResponsiveSizeProvider.width(context) * 0.01),
                        width: ResponsiveSizeProvider.width(context) * 0.02,
                        height: ResponsiveSizeProvider.height(context) * 0.02,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ],
                  );
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ))
      ],
    );
  }
}
