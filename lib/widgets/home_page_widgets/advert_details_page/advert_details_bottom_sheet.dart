import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_events.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/styles/info_page_style.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_description.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_title.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_views.dart';
import 'advert_details_information.dart';
import 'advert_details_price_and_social_network_icons.dart';

class AdvertDetailsBottomSheet extends StatelessWidget {
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
                child: ListView.builder(
                  itemCount: 1,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AdvertDetailsViews(),
                          AdvertDetailsTitle(),
                          AdvertDetailsPriceAndSocialNetworkIcons(),
                          AdvertDetailsDescription(),
                          AdvertDetailsInformation(),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
      );
    });
  }
}
