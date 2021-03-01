import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/indicator_bloc.dart';

class GoldAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IndicatorBloc _indicatorBLoc = BlocProvider.of<IndicatorBloc>(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final String goldImage1 = 'images/gold_ad.png';
    final String goldImage2 = 'images/gold_ad2.png';
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
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
              onPageChanged: (index, reason) {
                index == 0
                    ? _indicatorBLoc.add(IndicatorEvent.first_item_selected)
                    : _indicatorBLoc.add(IndicatorEvent.second_item_selected);
              }),
        ),
        Container(
          margin: EdgeInsets.only(left: _width * 0.45, bottom: _height * 0.03),
          child: Row(
            children: [
              BlocBuilder<IndicatorBloc, Color>(
                builder: (context, indicatorColor) {
                  return Container(
                    height: _height * 0.025,
                    width: _width * 0.025,
                    margin: EdgeInsets.symmetric(
                        vertical: _height * 0.025, horizontal: _width * 0.01),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: indicatorColor),
                  );
                },
              ),
              BlocBuilder<IndicatorBloc, Color>(
                builder: (context, indicatorColor) {
                  return Container(
                    height: _height * 0.025,
                    width: _width * 0.025,
                    margin: EdgeInsets.symmetric(
                        vertical: _height * 0.025, horizontal: _width * 0.01),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: indicatorColor),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
