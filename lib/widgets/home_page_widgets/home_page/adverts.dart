import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_states.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_events.dart';
import 'package:loook/pages/home/advert_details_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/styles/home_page_style.dart';

class Adverts extends StatelessWidget {
  final List<dynamic> adverts;
  Adverts({@required this.adverts});
  @override
  Widget build(BuildContext context) {
    FavoriteAdvertsListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteAdvertsListBloc>(context);
    AdvertByIdBloc _advertByIdBloc = BlocProvider.of<AdvertByIdBloc>(context);
    return ListView.separated(
      padding: EdgeInsets.only(
          left: ResponsiveSizeProvider.width(context) * 0.04,
          right: ResponsiveSizeProvider.width(context) * 0.04),
      separatorBuilder: (context, index) {
        return SizedBox(width: ResponsiveSizeProvider.width(context) * 0.07);
      },
      scrollDirection: Axis.horizontal,
      itemCount: adverts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _advertByIdBloc.add(FetchAdvertByIdEvent(id: adverts[index].id));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvertDetailsPage()));
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
                        child:
                            // does an advert has an image?
                            adverts[index].images.isNotEmpty
                                ? Image.network(
                                    adverts[index].images[0]['file'],
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
                  BlocBuilder<FavoriteAdvertsListBloc, FavoriteAdvertsListStates>(
                    builder: (context, state) {
                      if (state is AdvertLikedState) if (state.index == index)
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
                                .add(AdvertLikedEvent(index: index, id: adverts[index].id));
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
                  adverts[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: HomePageStyle.descriptionTextStyle,
                ),
              ),
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.4,
                child: Text(
                  adverts[index].price.toString() +
                      ' ' +
                      adverts[index].currency,
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
  }
}
