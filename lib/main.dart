import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/check_box_bloc/check_box_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_states.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_states.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_bloc.dart';
import 'package:loook/pages/account/account_page.dart';
import 'package:loook/pages/chat/chats_page.dart';
import 'package:loook/pages/home/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_states.dart';
import 'bloc/account_page_blocs/vip_page_bloc/vip_page_bloc.dart';
import 'bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_states.dart';
import 'bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'bloc/favorites_page_blocs/favorite_list_states.dart';
import 'bloc/home_page_blocs/adverts_list_bloc/adverts_list_states.dart';
import 'bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_bloc.dart';
import 'bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_states.dart';
import 'bloc/home_page_blocs/tab_bar_bloc/tab_bar_bloc.dart';
import 'bloc/home_page_blocs/tab_bar_bloc/tab_bar_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox('tokensBox');
  runApp(MaterialApp(home: MyApp()));
}

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
                  create: (context) => CategoriesTabBarBloc(
                    HideTabBarState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => SubCategoriesTabBarBloc(
                    CategoriesTabBarState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => FavoriteListBloc(
                    AdvertNotLikedState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => BottomSheetBloc(
                    WithRoundedCornersState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => IndicatorBloc(
                    FirstItemSelectedState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => AdvertDetailsBloc(
                    AdvertDetailsIsEmptyState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => MediaPickerBloc(
                    ImageNotSelectedState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => AdvertsListBloc(
                    AdvertsListFetchedState(),
                  ),
                ),
                BlocProvider(create: (context)=> ChosedDetailsBloc(DetailsNotChosedState()))
              ],
              child: HomePage(),
            );
          if (state is ChatPageState)
            return MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => AdvertDetailsBloc(
                  AdvertDetailsIsEmptyState(),
                ),
              ),
              BlocProvider(
                create: (context) => MediaPickerBloc(ImageNotSelectedState()),
              ),
               BlocProvider(create: (context)=> ChosedDetailsBloc(DetailsNotChosedState()))
            ], child: ChatsPage());
          if (state is AccountPageState)
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AuthenticationBloc(
                      Hive.box('tokensBox').get('accessToken') != null
                          ? SignedInState()
                          : NotAuthenticatedState()),
                ),
                BlocProvider(
                  create: (context) => CheckBoxBloc(false),
                ),
                BlocProvider(
                  create: (context) => VipPageBloc(2),
                ),
                BlocProvider(
                  create: (context) => AdvertDetailsBloc(
                    AdvertDetailsIsEmptyState(),
                  ),
                ),
                BlocProvider(
                  create: (context) => MediaPickerBloc(ImageNotSelectedState()),
                ),
                 BlocProvider(create: (context)=> ChosedDetailsBloc(DetailsNotChosedState()))
              ],
              child: AccountPage(),
            );
          return Center(
            child: Text('Возникла непредвиденная ошибка!'),
          );
        },
      ),
    );
  }
}
