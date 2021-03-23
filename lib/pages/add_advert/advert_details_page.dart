import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/pages/add_advert/add_description_page.dart';
import 'package:loook/pages/add_advert/add_media_page.dart';
import 'package:loook/pages/add_advert/add_price_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/advert_details_page/advert_details_title_and_navigation_button.dart';
import 'package:loook/widgets/add_advert_pages_widgets/advert_details_page/advert_details_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AdvertDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _categoriesDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    _categoriesDetailsBloc.add(FetchCategoryDetailsEvent());
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
        builder: (context, state) {
          print('$state');
          if (state is AddMediaPageState) return AddMediaPage();
          if (state is AddDescriptionPageState) return AddDescriptionPage();
          if (state is AddPricePageState) return AddPricePage();
          return ListView(
            children: [
              SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
              ChosenDetailsList(),
              SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
              AdvertDetailsTitle(
                state: state,
              ),
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.05,
              ),
              AdvertDetailsList(
                state: state,
              ),
            ],
          );
        },
      ),
    );
  }
}
