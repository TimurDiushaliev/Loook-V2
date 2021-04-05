import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';

class AdvertsByCategory extends StatelessWidget {
  final String category;
  final List<dynamic> adverts;
  AdvertsByCategory({@required this.category, @required this.adverts});

  @override
  Widget build(BuildContext context) {
    FavoriteAdvertsListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteAdvertsListBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppBarTitle(),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: ResponsiveSizeProvider.height(context) * 0.025),
          Container(
            margin: EdgeInsets.only(
                left: ResponsiveSizeProvider.width(context) * 0.05),
            child: Text('$category',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          SizedBox(height: ResponsiveSizeProvider.height(context) * 0.025),
          GridView.builder(
            itemCount: adverts.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.65, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            child: adverts[index].images.isNotEmpty
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
                            },
                          );
                        },
                      )
                    ],
                  ),
                  Container(
                    width: ResponsiveSizeProvider.width(context) * 0.4,
                    child: Text(
                      '${adverts[index].title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Text(
                    '${adverts[index].price}' + ' ${adverts[index].currency}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
