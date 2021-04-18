import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_states.dart';
import 'package:loook/bloc/account_page_blocs/vip_page_bloc/vip_page_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_states.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_states.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/bloc/authentication_page_blocs/check_box_bloc/check_box_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_bloc/bottom_app_bar_states.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_states.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_states.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_details_bottom_sheet_bloc/advert_details_bottom_sheet_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_details_images_bloc/advert_details_images_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_states.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:loook/bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search-delegate_bloc.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search_delegate_states.dart';
import 'package:loook/pages/account/account_page.dart';
import 'package:loook/pages/chat/chats_page.dart';
import 'package:loook/pages/favorites/favorites_page.dart';
import 'package:loook/pages/home/home_page.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_details_bottom_sheet_bloc/advert_details_bottom_sheet_states.dart';

class MainRoute extends StatelessWidget {
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
                      BottomSheetBloc(WithRoundedCornersState()),
                ),
                BlocProvider(
                  create: (context) => IndicatorBloc(FirstItemSelectedState()),
                ),
                BlocProvider(
                  create: (context) =>
                      AdvertDetailsBloc(AdvertDetailsIsEmptyState()),
                ),
                BlocProvider(
                  create: (context) => MediaPickerBloc(ImageNotSelectedState()),
                ),
                BlocProvider(
                    create: (context) =>
                        AdvertsListBloc(AdvertsListIsNotFetchedState())),
                BlocProvider(
                    create: (context) =>
                        ChosedDetailsBloc(DetailsNotChosedState())),
                BlocProvider(
                    create: (context) =>
                        AdvertByIdBloc(AdvertByIdNotFetchedState())),
                BlocProvider(
                    create: (context) => SearchDelegateBloc(
                        AdvertsViaSearchDelegateNotFetchedState())),
                BlocProvider(
                    create: (context) =>
                        FavoriteAdvertsListBloc(AdvertNotLikedState())),
                BlocProvider(
                  create: (context) => AdvertDetailsImagesBloc(1),
                ),
                BlocProvider(create: (context)=> AdvertDetailsBottomSheetBloc(AdvertDetailsWithRoundedCornersState()))
              ],
              child: HomePage(),
            );
          if (state is FavoritesPageState)
            return MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) =>
                    AdvertDetailsBloc(AdvertDetailsIsEmptyState()),
              ),
              BlocProvider(
                  create: (context) =>
                      FavoriteAdvertsListBloc(AdvertNotLikedState())),
              BlocProvider(
                  create: (context) =>
                      ChosedDetailsBloc(DetailsNotChosedState())),
              BlocProvider(
                  create: (context) =>
                      MediaPickerBloc(ImageNotSelectedState())),
              BlocProvider(
                  create: (context) =>
                      AdvertByIdBloc(AdvertByIdNotFetchedState())),
              BlocProvider(
                create: (context) => BottomSheetBloc(WithRoundedCornersState()),
              ),
              BlocProvider(
                create: (context) => AdvertDetailsImagesBloc(1),
              ),
            ], child: FavoritesPage());
          if (state is ChatPageState)
            return MultiBlocProvider(providers: [
              BlocProvider(
                  create: (context) => AdvertDetailsBloc(
                        AdvertDetailsIsEmptyState(),
                      )),
              BlocProvider(
                  create: (context) =>
                      MediaPickerBloc(ImageNotSelectedState())),
              BlocProvider(
                  create: (context) =>
                      ChosedDetailsBloc(DetailsNotChosedState())),
            ], child: ChatsPage());
          if (state is AccountPageState)
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => CheckBoxBloc(false)),
                BlocProvider(create: (context) => VipPageBloc(2)),
                BlocProvider(
                    create: (context) =>
                        AdvertDetailsBloc(AdvertDetailsIsEmptyState())),
                BlocProvider(
                    create: (context) =>
                        MediaPickerBloc(ImageNotSelectedState())),
                BlocProvider(
                    create: (context) =>
                        ChosedDetailsBloc(DetailsNotChosedState())),
                BlocProvider(
                    create: (context) =>
                        AccountAdvertsBloc(AccountAdvertsNotFetchedState())),
                BlocProvider(
                  create: (context) =>
                      AuthenticationBloc(NotAuthenticatedState()),
                ),
                BlocProvider(
                    create: (context) =>
                        AdvertByIdBloc(AdvertByIdNotFetchedState())),
                BlocProvider(
                  create: (context) =>
                      BottomSheetBloc(WithRoundedCornersState()),
                ),
                BlocProvider(
                  create: (context) => AdvertDetailsImagesBloc(1),
                ),
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
