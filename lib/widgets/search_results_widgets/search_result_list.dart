import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_events.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search-delegate_bloc.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search_delegate_states.dart';
import 'package:loook/pages/home/advert_details_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SearchResultList extends StatelessWidget {
  final String query;
  SearchResultList({@required this.query});
  @override
  Widget build(BuildContext context) {
    AdvertByIdBloc _advertByIdBloc = BlocProvider.of<AdvertByIdBloc>(context);
    return BlocBuilder<SearchDelegateBloc, SearchDelegateStates>(
      builder: (context, state) {
        if (state is AdvertsViaSearchDelegateFetchedState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
                Text(
                  'Надейно ${state.searchDelegateResultsList.length} объявлений по поиску $query',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveSizeProvider.width(context) * 0.07),
                  child: GridView.builder(
                    itemCount: state.searchDelegateResultsList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing:
                          ResponsiveSizeProvider.width(context) * 0.1,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _advertByIdBloc.add(FetchAdvertByIdEvent(
                              id: state.searchDelegateResultsList[index].id));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdvertDetailsPage()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:
                                  ResponsiveSizeProvider.width(context) * 0.43,
                              child: AspectRatio(
                                aspectRatio: 4 / 4.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child:
                                      // does an advert has an image?
                                      state.searchDelegateResultsList[index]
                                              .images.isNotEmpty
                                          ? Image.network(
                                              state
                                                  .searchDelegateResultsList[
                                                      index]
                                                  .images[0]['file'],
                                              fit: BoxFit.cover,
                                            )
                                          :
                                          //otherwise return default image
                                          Image.network(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/488px-No-Image-Placeholder.svg.png',
                                              fit: BoxFit.cover,
                                            ),
                                ),
                              ),
                            ),
                            Text(
                                '${state.searchDelegateResultsList[index].title}',
                                style: TextStyle(color: Colors.black)),
                            Text(
                                '${state.searchDelegateResultsList[index].price}' +
                                    ' ${state.searchDelegateResultsList[index].currency}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
