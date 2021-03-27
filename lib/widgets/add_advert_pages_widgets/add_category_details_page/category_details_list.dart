import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/pages/add_advert/add_media_page.dart';

class CategoryDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
      builder: (context, state) {
        if (state is CategoryDetailsFetchedState) {
          return ListView.builder(
            itemCount: state.values.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (state.categoryDetailsMap.length != state.key.length) {
                    _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
                      "fields": {state.key: state.values[index]}
                    }));
                    _advertDetailsBloc.add(FetchNextCategoryDetailsEvent());
                  } else {
                    _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
                      "fields": {state.key: state.values[index]}
                    }));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMediaPage()));
                  }
                },
                child: Card(
                  child: ListTile(
                    title: Text(state.values[index].toString()),
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
