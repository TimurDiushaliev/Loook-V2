import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_events.dart';
import 'package:loook/pages/add_advert/add_media_page.dart';
import 'package:loook/pages/add_advert/add_subcategory_page.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    ChosedDetailsBloc _chosedDetailsBloc =
        BlocProvider.of<ChosedDetailsBloc>(context);
    return BlocConsumer<AdvertDetailsBloc, AdvertDetailsStates>(
      listener: (context, state) {
        if (state is CategoriesListNotFetchedState)
          _advertDetailsBloc.add(FetchCategoriesListEvent());
      },
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
                  _chosedDetailsBloc.add(DetailIsChosedEvent(
                      chosedDetail: state.categoriesDetailsList[index].name));
                  if (state.categoriesDetailsList[index].children.isNotEmpty) {
                    BlocProvider.of<AdvertDetailsBloc>(context)
                        .add(FetchSubCategoriesListEvent(categoryIndex: index));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddSubCategoryPage(categoryIndex: index)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMediaPage()));
                  }
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
