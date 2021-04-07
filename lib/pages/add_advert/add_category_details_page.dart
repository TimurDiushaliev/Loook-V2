import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_details_page/category_details_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_details_page/category_details_title.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddCategoryDetailsPage extends StatelessWidget {
  final int categoryIndex;
  final subCategoryIndex;
  AddCategoryDetailsPage(
      {@required this.categoryIndex, @required this.subCategoryIndex});
  @override
  Widget build(BuildContext context) {
    ChosedDetailsBloc _chosedDetailsBloc =
        BlocProvider.of<ChosedDetailsBloc>(context);
    BlocProvider.of<AdvertDetailsBloc>(context)
        .add(FetchCategoryDetailsEvent(subCategoryIndex: subCategoryIndex));
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
      builder: (context, state) {
        print(state);
        return WillPopScope(
          onWillPop: () {
            _chosedDetailsBloc.add(RemoveLastIndexOfChosedDetailsEvent());
            if (state is CategoryDetailsFetchedState) {
              if (state.keyIndex != 0) {
                BlocProvider.of<AdvertDetailsBloc>(context)
                    .add(FetchPreviousCategoryDetailsEvent());
              } else {
                BlocProvider.of<AdvertDetailsBloc>(context).add(
                    FetchSubCategoriesListEvent(categoryIndex: categoryIndex));
                Navigator.pop(context);
              }
            }
          },
          child: Scaffold(
            appBar: AppBar(),
            body: ListView(
              children: [
                SizedBox(
                  height: ResponsiveSizeProvider.height(context) * 0.05,
                ),
                ChosedDetailsList(),
                SizedBox(
                  height: ResponsiveSizeProvider.height(context) * 0.05,
                ),
                CategoryDetailsTitle(),
                SizedBox(
                  height: ResponsiveSizeProvider.height(context) * 0.05,
                ),
                CategoryDetailsList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
