import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';
import 'package:loook/pages/home/advert_details.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/styles/home_page_style.dart';

class Adverts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteListBloc>(context);
    return Container(
      margin: EdgeInsets.only(top: MediaQuerySize.height(context) * 0.03),
      child: ListView.separated(
          padding: EdgeInsets.only(
              left: MediaQuerySize.width(context) * 0.04,
              right: MediaQuerySize.width(context) * 0.04),
          separatorBuilder: (context, index) {
            return SizedBox(width: MediaQuerySize.width(context) * 0.07);
          },
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdvertDetails())),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: MediaQuerySize.width(context) * 0.43,
                        height: MediaQuerySize.height(context) * 0.3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://24tv.ua/resources/photos/news/1200x675_DIR/202011/1467558.jpg?202011105451',
                              fit: BoxFit.cover,
                            )),
                      ),
                      BlocBuilder<FavoriteListBloc, FavoriteListStates>(
                          builder: (context, state) {
                        if (state is AdvertLikedState)
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
                              _favoriteListBloc.add(AdvertLikedEvent());
                            });
                      })
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuerySize.height(context) * 0.03,
                      bottom: MediaQuerySize.height(context) * 0.02,
                    ),
                    width: MediaQuerySize.width(context) * 0.4,
                    height: MediaQuerySize.height(context) * 0.05,
                    child: Text(
                      'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: HomePageStyle.descriptionTextStyle,
                    ),
                  ),
                  Container(
                    width: MediaQuerySize.width(context) * 0.4,
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
          }),
    );
  }
}
