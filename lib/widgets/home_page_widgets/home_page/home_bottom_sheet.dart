import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_events.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/bloc/home_page_blocs/tab_bar_bloc/tab_bar_bloc.dart';
import 'package:loook/bloc/home_page_blocs/tab_bar_bloc/tab_bar_events.dart';
import 'package:loook/styles/home_page_style.dart';
import 'package:loook/values/strings.dart';
import 'package:loook/widgets/home_page_widgets/home_page/adverts.dart';
import 'package:loook/widgets/home_page_widgets/home_page/adverts_categorie_title.dart';

class HomeBottomSheet extends StatefulWidget {
  @override
  _HomeBottomSheetState createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  @override
  void initState() {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context)
          ..add(FetchCategoriesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BottomSheetBloc _bottomSheetBloc =
        BlocProvider.of<BottomSheetBloc>(context);
    CategoriesTabBarBloc _categoriesTabBarBloc =
        BlocProvider.of<CategoriesTabBarBloc>(context);
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
                  child: BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
                    builder: (context, state) {
                      if (state is CategoriesListFetchedState) {
                        // print(
                        //     state.categoriesDetailsList[1].adverts[0].category);
                        return ListView.builder(
                          itemCount: state.categoriesDetailsList.length,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 1,
                              child: Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 5.5,
                                    child: AdvertsByCategorieTitle(
                                        title: state
                                            .categoriesDetailsList[index].name,
                                        index: index),
                                  ),
                                  Expanded(
                                    child: Adverts(
                                      adverts: state
                                          .categoriesDetailsList[index].adverts,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey[400],
                                    thickness: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
