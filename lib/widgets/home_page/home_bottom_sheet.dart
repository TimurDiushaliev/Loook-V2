import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_events.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/styles/home_page_style.dart';
import 'package:loook/widgets/home_page/ads.dart';

class HomeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;
    BottomSheetBloc _bottomSheetBloc =
        BlocProvider.of<BottomSheetBloc>(context);
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        notification.extent == 1.0
            ? _bottomSheetBloc.add(WithUsualCornersEvent())
            : _bottomSheetBloc.add(WithRoundedCornersEvent());
      },
      child: BlocBuilder<BottomSheetBloc, BottomSheetStates>(
        builder: (context, state) {
          return DraggableScrollableSheet(
              initialChildSize: 0.55,
              minChildSize: 0.55,
              builder: (context, scrollController) {
                return Container(
                  decoration: state is WithRoundedCornersState
                      ? HomePageStyle.bottomSheetStyleWithRoundedCorners
                      : HomePageStyle.bottomSheetStyleWithUsualCorners,
                  child: ListView.builder(
                      itemCount: 4,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return Container(
                          // color: index % 2 == 0 ? Colors.red : Colors.blue,
                          height: _height * 0.7,
                          child: Column(
                            children: [
                              Container(
                                height: _height * 0.1,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: _width * 0.05,
                                          top: _height * 0.03,
                                          bottom: _height * 0.03),
                                      child: Text('Категории',
                                          style: HomePageStyle
                                              .categoriesTextStyle),
                                    ),
                                    Spacer(),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: _width * 0.08),
                                      child: Text(
                                        'Выбрать',
                                        style:
                                            HomePageStyle.chooseTextButtonStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(child: Ads()),
                              Divider(
                                color: Colors.grey[400],
                                thickness: 2,
                              ),
                            ],
                          ),
                        );
                      }),
                );
              });
        },
      ),
    );
  }
}
