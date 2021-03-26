import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_events.dart';
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
    AdvertDetailsBloc _fetchingCategoriesBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    _fetchingCategoriesBloc.add(FetchCategoriesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteListBloc>(context);
    AdvertsListBloc _advertsListBloc =
        BlocProvider.of<AdvertsListBloc>(context);
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
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
            if (state is CategoriesListFetchedState)
              return GestureDetector(
                onTap: () {
                  _advertsListBloc.add(FetchAdvertsListEvent());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdvertDetailsPage(
                              id: state.categoriesDetailsList[widget.index]
                                  .adverts[index].id)));
                },
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: ResponsiveSizeProvider.width(context) * 0.43,
                          child: AspectRatio(
                            aspectRatio: 4 / 4.5,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: state.categoriesDetailsList[widget.index]
                                        .adverts[index].images.isNotEmpty
                                    ? Image.network(
                                        state
                                            .categoriesDetailsList[widget.index]
                                            .adverts[index]
                                            .images[0]['file'],
                                        fit: BoxFit.cover,
                                      )
                                    //default image
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
                                    _favoriteListBloc
                                        .add(AdvertNotLikedEvent());
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
                        state.categoriesDetailsList[0].adverts[0].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: HomePageStyle.descriptionTextStyle,
                      ),
                    ),
                    Container(
                      width: ResponsiveSizeProvider.width(context) * 0.4,
                      child: Text(
                        state.categoriesDetailsList[0].adverts[0].price
                                .toString() +
                            ' ' +
                            state.categoriesDetailsList[0].adverts[0].currency,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: HomePageStyle.priceStyle,
                      ),
                    )
                  ],
                ),
              );
            return Column(
              children: [
                Container(
                  width: ResponsiveSizeProvider.width(context) * 0.43,
                  child: AspectRatio(
                    aspectRatio: 4 / 4.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[400],
                  margin: EdgeInsets.only(
                    top: ResponsiveSizeProvider.height(context) * 0.03,
                    bottom: ResponsiveSizeProvider.height(context) * 0.02,
                  ),
                  width: ResponsiveSizeProvider.width(context) * 0.4,
                  child: Text(
                    '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: HomePageStyle.descriptionTextStyle,
                  ),
                ),
                Container(
                  color: Colors.grey[400],
                  width: ResponsiveSizeProvider.width(context) * 0.4,
                  child: Text(
                    '',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: HomePageStyle.priceStyle,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
