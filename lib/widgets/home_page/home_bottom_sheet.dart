import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_events.dart';
import 'package:loook/bloc/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';
import 'package:loook/bloc/tab_bar_bloc/tab_bar_bloc.dart';
import 'package:loook/bloc/tab_bar_bloc/tab_bar_states.dart';
import 'package:loook/pages/home/adverts_by_category.dart';
import 'package:loook/styles/home_page_style.dart';
import 'package:loook/values/strings.dart';
import 'package:loook/widgets/home_page/adverts.dart';
import 'package:loook/widgets/home_page/categories_tab_bar.dart';

class HomeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;
    final _advertNotLikedState = AdvertNotLikedState();
    final _categoriesTabBarState = CategoriesTabBarState();
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
                                        left: _width * 0.05,
                                        top: _height * 0.03,
                                        bottom: _height * 0.03,
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
                                                    BlocProvider(
                                                      create: (context) =>
                                                          TabBarBloc(
                                                              _categoriesTabBarState),
                                                      child: BlocProvider(
                                                        create: (context) =>
                                                            FavoriteListBloc(
                                                                _advertNotLikedState),
                                                        child:
                                                            AdvertsByCategory(
                                                          categorie: Strings
                                                                  .categoriesList[
                                                              index],
                                                        ),
                                                      ),
                                                    )));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: _width * 0.08),
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
                              Expanded(
                                child: BlocProvider(
                                    create: (context) =>
                                        FavoriteListBloc(_advertNotLikedState),
                                    child: Adverts()),
                              ),
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
