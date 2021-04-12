import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search-delegate_bloc.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search_delegate_events.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search_delegate_states.dart';
import 'package:loook/pages/home/advert_details_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SearchResultList extends StatefulWidget {
  final String query;
  SearchResultList({@required this.query});

  @override
  _SearchResultListState createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchDelegateBloc>(context)
        .add(FetchAdvertsViaQueryEvent(query: widget.query, offset: 0));
    return BlocConsumer<SearchDelegateBloc, SearchDelegateStates>(
      listener: (context, state) {
        if (state is AdvertsViaSearchDelegateTokenNotValidState) {
          BlocProvider.of<SearchDelegateBloc>(context)
              .add(FetchAdvertsViaQueryEvent(query: widget.query, offset: 0));
        }
      },
      builder: (context, state) {
        print(state);
        if (state is AdvertsViaSearchDelegateFetchedState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
                Container(
                  margin: EdgeInsets.only(
                      left: ResponsiveSizeProvider.width(context) * 0.05),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Найдено ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        TextSpan(
                            text: '${state.searchDelegateResultsList.length}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'объявлений по поиску: ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        TextSpan(
                            text: '${widget.query}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
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
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdvertDetailsPage(
                                          id: state
                                              .searchDelegateResultsList[index]
                                              .id)));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: ResponsiveSizeProvider.width(context) *
                                      0.43,
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
                          ),
                          IconButton(
                            icon: Icon(
                              state.searchDelegateResultsList[index].isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              BlocProvider.of<AdvertDetailsBloc>(context).add(
                                  LikeAdvertEvent(
                                      id: state.searchDelegateResultsList[index]
                                          .id));
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        if (state is AdvertsViaSearchDelegateIsEmptyState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'По запросу: ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: '${widget.query}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: ' ничего не найдено!',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
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
