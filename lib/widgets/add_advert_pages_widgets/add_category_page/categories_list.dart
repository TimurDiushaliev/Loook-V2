import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/pages/add_advert/add_media_page.dart';
import 'package:loook/pages/add_advert/add_subcategory_page.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
      builder: (context, state) {
        if (state is CategoriesListFetchedState) {
          return GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.categoriesDetailsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
                    'category': state.categoriesDetailsList[index].name
                  }));
                  state.categoriesDetailsList[index].children.isNotEmpty
                      ? _advertDetailsBloc
                          .add(FetchSubCategoriesListEvent(index: index))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMediaPage()));
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
