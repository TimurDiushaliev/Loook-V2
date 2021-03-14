import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_states.dart';
import 'package:loook/pages/chat/chat_page.dart';
import 'package:loook/pages/home/home_page.dart';
import 'package:loook/pages/account/account_page.dart';
import 'bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'bloc/favorites_page_blocs/favorite_list_states.dart';
import 'bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_bloc.dart';
import 'bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_states.dart';
import 'bloc/home_page_blocs/tab_bar_bloc/tab_bar_bloc.dart';
import 'bloc/home_page_blocs/tab_bar_bloc/tab_bar_states.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomAppBarBloc(HomePageState()),
      child: BlocBuilder<BottomAppBarBloc, BottomAppBarStates>(
        builder: (context, state) {
          if (state is HomePageState)
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        CategoriesTabBarBloc(HideTabBarState())),
                BlocProvider(
                    create: (context) =>
                        SubCategoriesTabBarBloc(CategoriesTabBarState())),
                BlocProvider(
                    create: (context) =>
                        FavoriteListBloc(AdvertNotLikedState())),
                BlocProvider(
                    create: (context) =>
                        FavoriteListBloc(AdvertNotLikedState())),
                BlocProvider(
                    create: (context) =>
                        BottomSheetBloc(WithRoundedCornersState())),
                BlocProvider(
                    create: (context) =>
                        IndicatorBloc(FirstItemSelectedState())),
                BlocProvider(
                    create: (context) =>
                        BottomSheetBloc(WithRoundedCornersState())),
              ],
              child: HomePage(),
            );
          if (state is ChatPageState)
           return ChatPage();
          if (state is AccountPageState) return AccountPage();
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
