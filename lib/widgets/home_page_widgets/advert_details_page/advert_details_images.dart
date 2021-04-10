import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_states.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_details_images_bloc/advert_details_images_bloc.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertByIdBloc, AdvertByIdStates>(
      builder: (context, state) {
        if (state is AdvertByIdFetchedState)
          return Stack(
            children: [
              CarouselSlider(
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
                  onPageChanged: (index, reason) {
                    BlocProvider.of<AdvertDetailsImagesBloc>(context)
                        .add(index + 1);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18)),
                margin: EdgeInsets.only(
                    left: ResponsiveSizeProvider.width(context) * 0.8,
                    top: ResponsiveSizeProvider.height(context) * 0.02),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<AdvertDetailsImagesBloc, int>(
                      builder: (context, index) =>
                          Text('$index / ${state.advertById.images.length}')),
                ),
              ),
            ],
          );
        return CarouselSlider(
          items: [
            Center(child: CircularProgressIndicator()),
          ],
          options: CarouselOptions(
            height: ResponsiveSizeProvider.height(context) * 0.4,
            enableInfiniteScroll: false,
            viewportFraction: 1,
          ),
        );
      },
    );
  }
}
