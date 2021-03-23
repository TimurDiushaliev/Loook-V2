import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';
import 'package:loook/pages/home/advert_details_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/styles/home_page_style.dart';

class Adverts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteListBloc>(context);
    return ListView.separated(
        padding: EdgeInsets.only(
            left: ResponsiveSizeProvider.width(context) * 0.04,
            right: ResponsiveSizeProvider.width(context) * 0.04),
        separatorBuilder: (context, index) {
          return SizedBox(width: ResponsiveSizeProvider.width(context) * 0.07);
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvertDetailsPage())),
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
                            child: Image.network(
                              'https://crimeandrelativedimensioninspace.files.wordpress.com/2020/11/queens-gambit-chess-player-review.jpg',
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    BlocBuilder<FavoriteListBloc, FavoriteListStates>(
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
                                .add(AdvertLikedEvent(index: index));
                          });
                    })
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveSizeProvider.height(context) * 0.03,
                    bottom: ResponsiveSizeProvider.height(context) * 0.02,
                  ),
                  width: ResponsiveSizeProvider.width(context) * 0.4,
                  child: Text(
                    'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: HomePageStyle.descriptionTextStyle,
                  ),
                ),
                Container(
                  width: ResponsiveSizeProvider.width(context) * 0.4,
                  child: Text(
                    '312215 KGS',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: HomePageStyle.priceStyle,
                  ),
                )
              ],
            ),
          );
        });
  }
}
