import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_events.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/bloc/home_page_blocs/tab_bar_bloc/tab_bar_bloc.dart';
import 'package:loook/bloc/home_page_blocs/tab_bar_bloc/tab_bar_events.dart';
import 'package:loook/pages/home/adverts_by_category.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/styles/home_page_style.dart';
import 'package:loook/values/strings.dart';
import 'package:loook/widgets/home_page/adverts.dart';

class HomeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BottomSheetBloc _bottomSheetBloc =
        BlocProvider.of<BottomSheetBloc>(context);
    CategoriesTabBarBloc _categoriesTabBarBloc = BlocProvider.of<CategoriesTabBarBloc>(context);
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == 1) {
          _categoriesTabBarBloc.add(ShowTabBarEvent());
          _bottomSheetBloc.add(WithUsualCornersEvent());
        } else {
          _categoriesTabBarBloc.add(HideTabBarEvent());
          _bottomSheetBloc.add(WithRoundedCornersEvent());
        }
      },
      child: BlocBuilder<BottomSheetBloc, BottomSheetStates>(
        builder: (context, state) {
          return DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, scrollController) {
                return Container(
                  decoration: state is WithRoundedCornersState
                      ? HomePageStyle.bottomSheetStyleWithRoundedCorners
                      : HomePageStyle.bottomSheetStyleWithUsualCorners,
                  child: ListView.builder(
                      itemCount: Strings.categoriesList.length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 1,
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 5.5,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuerySize.width(context) *
                                            0.05,
                                        top: MediaQuerySize.height(context) *
                                            0.03,
                                        bottom: MediaQuerySize.height(context) *
                                            0.03,
                                      ),
                                      child: Text(Strings.categoriesList[index],
                                          style: HomePageStyle
                                              .categoriesTextStyle),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AdvertsByCategory(
                                                categorie: Strings
                                                    .categoriesList[index],
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right:
                                                MediaQuerySize.width(context) *
                                                    0.08),
                                        child: Text(
                                          'Выбрать',
                                          style: HomePageStyle
                                              .chooseTextButtonStyle,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(child: Adverts()),
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
