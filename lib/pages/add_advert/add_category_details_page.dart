import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AddCategoryDetailsPage extends StatelessWidget {
  final int index;
  AddCategoryDetailsPage({@required this.index});
  @override
  Widget build(BuildContext context) {
    FetchingCategoriesBloc _fetchingCategoriesBloc =
        BlocProvider.of<FetchingCategoriesBloc>(context);
    print('123');
    print(index);
    return WillPopScope(
      onWillPop: () {
        _fetchingCategoriesBloc.add(FetchSubCategoriesListEvent(index: index));
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<FetchingCategoriesBloc, FetchingCategoriesStates>(
          builder: (context, state) {
            if (state is CategoryDetailsFetchedState) {
              print('${state.categoryDetailsMap}');
              return ListView(
                children: [
                  SizedBox(
                    height: ResponsiveSizeProvider.height(context) * 0.05,
                  ),
                  Text(
                    state.categoryDetailsMap.keys.elementAt(0).toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: ResponsiveSizeProvider.height(context) * 0.05,
                  ),
                  ListView.builder(
                    itemCount:
                        state.categoryDetailsMap.values.elementAt(0).length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.categoryDetailsMap.values
                            .elementAt(0)[index]
                            .toString()),
                      );
                    },
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
