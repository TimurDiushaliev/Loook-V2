import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search-delegate_bloc.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search_delegate_states.dart';

class SearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchDelegateBloc, SearchDelegateStates>(
      builder: (context, state) {
        if (state is AdvertsViaSearchDelegateFetchedState) {
          return GridView.builder(
            itemCount: state.searchDelegateResultsList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Image.network(
                  state.searchDelegateResultsList[index].images[0]['file']);
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
