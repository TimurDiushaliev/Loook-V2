import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_media_page/add_media_actions.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_media_page/add_media_title_and_navigation.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_media_page/added_media_list.dart';

import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddMediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaPickerBloc, MediaPickerStates>(
      builder: (context, state){
          return ListView(
        children: [
          SizedBox(height: ResponsiveSizeProvider.height(context) * 0.03),
          ChosenDetailsList(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.07,
          ),
          AddMediaTitleAndNavigation(state: state,),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.04,
          ),
          AddMediaActions(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          AddedMediaList(state: state),
        ],
      );}
    );
  }
}
