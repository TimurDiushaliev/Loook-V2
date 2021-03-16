import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loook/bloc/account_page_blocs/vip_page_bloc/vip_page_bloc.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/premium_pages/vip_page/vip_description.dart';


class VipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VipPageBloc _vipPageBloc = BlocProvider.of<VipPageBloc>(context);
    return Column(
      children: [
        SizedBox(
          height: ResponsiveSizeProvider.height(context) * 0.1,
        ),
        SvgPicture.asset('images/premium/vip.svg'),
        SizedBox(
          height: ResponsiveSizeProvider.height(context) * 0.1,
        ),
        VipDescription(),
        BlocBuilder<VipPageBloc, int>(
          builder: (context, state) {
            return Container(
              width: ResponsiveSizeProvider.width(context) * 0.3,
              child: CarouselSlider(
                items: [1, 2, 3, 4, 5]
                    .map(
                      (e) => Text(
                        e.toString(),
                        style: TextStyle(
                            fontSize: 25,
                            color: state == e ? Colors.white : Colors.grey),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    initialPage: 2,
                    enableInfiniteScroll: false,
                    height: ResponsiveSizeProvider.height(context) * 0.1,
                    viewportFraction: 0.45,
                    onPageChanged: (index, reason) {
                      _vipPageBloc.add(index);
                    }),
              ),
            );
          },
        )
      ],
    );
  }
}
