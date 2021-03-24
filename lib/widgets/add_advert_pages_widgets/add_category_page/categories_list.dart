import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_states.dart';
import 'package:loook/pages/add_advert/add_media_page.dart';
import 'package:loook/pages/add_advert/add_subcategory_page.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchingCategoriesBloc _fetchingCategoriesBloc =
        BlocProvider.of<FetchingCategoriesBloc>(context);
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return BlocBuilder<FetchingCategoriesBloc, FetchingCategoriesStates>(
      builder: (context, state) {
        if (state is CategoriesListFetchedState) {
          print(state);
          return GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.categoriesDetailsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  state.categoriesDetailsList[index].children.isNotEmpty
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddSubCategoryPage()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMediaPage()));
                  _fetchingCategoriesBloc
                      .add(FetchSubCategoriesListEvent(index: index));
                  _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
                    'category': state.categoriesDetailsList[index].name
                  }));
                },
                child: Card(
                  color: Color(0x252837),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white)),
                  child: Center(
                    child: Text(state.categoriesDetailsList[index].name),
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
