import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_events.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/styles/info_page_style.dart';
import 'package:loook/widgets/advert_details_page/description.dart';
import 'package:loook/widgets/advert_details_page/information.dart';
import 'package:loook/widgets/advert_details_page/title.dart';

class InfoModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
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
                    ? InfoPageStyle.bottomSheetStyleWithRoundedCorners
                    : InfoPageStyle.bottomSheetStyleWithUsualCorners,
                child: ListView.builder(
                  itemCount: 1,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: _height * 0.02,
                                left: _width * 0.8,
                                right: _width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.visibility,
                                  color: Colors.grey[700],
                                ),
                                Text(
                                  '13',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          InfoTitle(),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: _width * 0.1),
                                child: Text(
                                  '230 KGS',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: _width * 0.25,
                              ),
                              Container(
                                width: _width * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: _height * 0.1,
                                      width: _width * 0.1,
                                      child: SvgPicture.asset(
                                        'images/social_network_icons/instagram_icon.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Container(
                                        height: _height * 0.1,
                                        width: _width * 0.1,
                                        child: SvgPicture.asset(
                                          'images/social_network_icons/telegram_icon.svg',
                                          fit: BoxFit.contain,
                                        )),
                                    Container(
                                        height: _height * 0.1,
                                        width: _width * 0.1,
                                        child: SvgPicture.asset(
                                          'images/social_network_icons/whatsapp_icon.svg',
                                          fit: BoxFit.contain,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          InfoDescription(),
                          Information(),
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
