import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_events.dart';
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
    ChosedDetailsBloc _chosedDetailsBloc =
        BlocProvider.of<ChosedDetailsBloc>(context);

    return WillPopScope(
      onWillPop: () {
        _chosedDetailsBloc.add(RemoveLastIndexOfChosedDetailsEvent());
        Navigator.pop(context);
      },
      child: BlocBuilder<MediaPickerBloc, MediaPickerStates>(
          builder: (context, state) {
     
        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: [
              SizedBox(height: ResponsiveSizeProvider.height(context) * 0.03),
              ChosedDetailsList(),
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.07,
              ),
              AddMediaTitleAndNavigation(
                state: state,
              ),
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.04,
              ),
              AddMediaActions(),
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.05,
              ),
              AddedMediaList(state: state),
            ],
          ),
        );
      }),
    );
  }
}
