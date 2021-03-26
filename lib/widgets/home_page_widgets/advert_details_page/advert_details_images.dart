import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertsListBloc, AdvertsListStates>(
      builder: (context, state) {
        if (state is AdvertsListFetchedState) {
          List<Widget> a = [];
          List b = state.adverts[0].images.map((e) => e['file']).toList();
          print('b: $b');
          print(b.runtimeType);
          for (var i in state.adverts[0].images) {
            if (i.isNotEmpty) {
              var widget = Image.network(i['file'].replaceFirst(':8000', ''));
              print(widget.runtimeType);
              a.add(widget);
            }
          }
          return Stack(
            children: [
              CarouselSlider(
                items: state.adverts[0].images.isNotEmpty
                    ? state.adverts[0].images[0]['file']
                    : Text(''),
                options: CarouselOptions(
                  height: ResponsiveSizeProvider.height(context) * 0.4,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                ),
              ),
            ],
          );
        }
        return Stack(
          children: [
            CarouselSlider(
              items: [
                Center(child: CircularProgressIndicator()),
                Center(child: CircularProgressIndicator()),
              ],
              options: CarouselOptions(
                height: ResponsiveSizeProvider.height(context) * 0.4,
                enableInfiniteScroll: false,
                viewportFraction: 1,
              ),
            ),
          ],
        );
      },
    );
  }
}
