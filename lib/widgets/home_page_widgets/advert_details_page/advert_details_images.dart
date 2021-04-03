import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_states.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertsListBloc, AdvertsListStates>(
      builder: (context, state) {
        if (state is AdvertsListFetchedState) {
          return Stack(
            children: [
              BlocBuilder<AdvertByIdBloc, AdvertByIdStates>(
                builder: (context, state) {
                  if (state is AdvertByIdFetchedState)
                    return CarouselSlider(
                      items: state.advertById.images
                          .map<Widget>(
                            (e) => Image.network(
                              e['file'],
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: ResponsiveSizeProvider.height(context) * 0.4,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                      ),
                    );
                  return CarouselSlider(
                    items: [Container()],
                    options: CarouselOptions(
                      height: ResponsiveSizeProvider.height(context) * 0.4,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                    ),
                  );
                },
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
