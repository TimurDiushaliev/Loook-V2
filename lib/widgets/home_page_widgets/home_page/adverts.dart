import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_states.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';
import 'package:loook/pages/home/advert_details_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/styles/home_page_style.dart';

class Adverts extends StatefulWidget {
  final int index;
  Adverts({@required this.index});
  @override
  _AdvertsState createState() => _AdvertsState();
}

class _AdvertsState extends State<Adverts> {
  @override
  void initState() {
    FetchingCategoriesBloc _fetchingCategoriesBloc =
        BlocProvider.of<FetchingCategoriesBloc>(context);
    _fetchingCategoriesBloc.add(FetchCategoriesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteListBloc>(context);
    return BlocBuilder<FetchingCategoriesBloc, FetchingCategoriesStates>(
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.only(
              left: ResponsiveSizeProvider.width(context) * 0.04,
              right: ResponsiveSizeProvider.width(context) * 0.04),
          separatorBuilder: (context, index) {
            return SizedBox(
                width: ResponsiveSizeProvider.width(context) * 0.07);
          },
          scrollDirection: Axis.horizontal,
          itemCount: state is CategoriesListFetchedState
              ? state.categoriesDetailsList[widget.index].adverts.length
              : 10,
          itemBuilder: (context, index) {
            print(state);
            return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdvertDetailsPage())),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      if (state is CategoriesListFetchedState)
                        Container(
                          width: ResponsiveSizeProvider.width(context) * 0.43,
                          child: AspectRatio(
                            aspectRatio: 4 / 4.5,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: state.categoriesDetailsList[widget.index]
                                        .adverts[index].images.isNotEmpty
                                    ? Image.network(
                                        'http://192.168.88.208' +
                                            state
                                                .categoriesDetailsList[
                                                    widget.index]
                                                .adverts[index]
                                                .images[0]['file'],
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg',
                                        fit: BoxFit.cover,
                                      )),
                          ),
                        ),
                      BlocBuilder<FavoriteListBloc, FavoriteListStates>(
                        builder: (context, state) {
                          if (state is AdvertLikedState) if (state.index ==
                              index)
                            return IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _favoriteListBloc.add(AdvertNotLikedEvent());
                                });
                          return IconButton(
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                _favoriteListBloc
                                    .add(AdvertLikedEvent(index: index));
                              });
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: ResponsiveSizeProvider.height(context) * 0.03,
                      bottom: ResponsiveSizeProvider.height(context) * 0.02,
                    ),
                    width: ResponsiveSizeProvider.width(context) * 0.4,
                    child: Text(
                      state is CategoriesListFetchedState
                          ? state.categoriesDetailsList[0].adverts[0].title
                          : '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: HomePageStyle.descriptionTextStyle,
                    ),
                  ),
                  Container(
                    width: ResponsiveSizeProvider.width(context) * 0.4,
                    child: Text(
                      state is CategoriesListFetchedState
                          ? state.categoriesDetailsList[0].adverts[0].price
                                  .toString() +
                              ' ' +
                              state.categoriesDetailsList[0].adverts[0].currency
                          : '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: HomePageStyle.priceStyle,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
