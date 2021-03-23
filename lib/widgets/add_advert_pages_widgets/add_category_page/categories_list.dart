import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';

class CategoriesList extends StatelessWidget {
  final dynamic state;
  CategoriesList({@required this.state});
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.categoriesDetailsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _advertDetailsBloc.add(FetchSubCategoriesListEvent());
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
}
