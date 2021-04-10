import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_events.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_states.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_events.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/styles/info_page_style.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_description.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_owner_name.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_title.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_views.dart';
import 'advert_details_information.dart';
import 'advert_details_price_and_social_network_icons.dart';

class AdvertDetailsBottomSheet extends StatelessWidget {
  final int id;
  AdvertDetailsBottomSheet({@required this.id});
  @override
  Widget build(BuildContext context) {
    BottomSheetBloc _bottomSheetBloc =
        BlocProvider.of<BottomSheetBloc>(context);
    return BlocBuilder<BottomSheetBloc, BottomSheetStates>(
      builder: (context, state) {
        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            notification.extent == 1.0
                ? _bottomSheetBloc.add(WithUsualCornersEvent())
                : _bottomSheetBloc.add(WithRoundedCornersEvent());
          },
          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: state is WithRoundedCornersState
                    ? AdvertDetailsPageStyle.bottomSheetStyleWithRoundedCorners
                    : AdvertDetailsPageStyle.bottomSheetStyleWithUsualCorners,
                child: BlocConsumer<AdvertByIdBloc, AdvertByIdStates>(
                  listener: (context, state) {
                    if (state is AdvertByIdTokenNoValidState) {
                      BlocProvider.of<AdvertByIdBloc>(context)
                          .add(FetchAdvertByIdEvent(id: id));
                    }
                  },
                  builder: (context, state) {
                    if (state is AdvertByIdFetchedState)
                      return ListView.builder(
                        itemCount: 1,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height:
                                        ResponsiveSizeProvider.height(context) *
                                            0.05),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AdvertDetailsTitle(
                                        title: state.advertById.title),
                                    AdvertDetailsViews(
                                        views: state.advertById.views),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      ResponsiveSizeProvider.height(context) *
                                          0.05,
                                ),
                                AdvertDetailsPriceAndSocialNetworkIcons(
                                    price: state.advertById.price,
                                    currency: state.advertById.currency),
                                AdvertDetailsDescription(
                                    description: state.advertById.description),
                                AdvertDetailsInformation(
                                    fields: state.advertById.fields),
                                AdvertDetailsOwnerName(
                                    ownername: state.advertById.owner),
                              ],
                            ),
                          );
                        },
                      );
                    return Container();
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
