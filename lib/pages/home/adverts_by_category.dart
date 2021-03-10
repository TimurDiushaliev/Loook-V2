import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';
import 'package:loook/bloc/tab_bar_bloc/tab_bar_bloc.dart';
import 'package:loook/bloc/tab_bar_bloc/tab_bar_events.dart';
import 'package:loook/bloc/tab_bar_bloc/tab_bar_states.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/values/strings.dart';
import 'package:loook/widgets/home_page/categories_tab_bar.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page/search.dart';

class AdvertsByCategory extends StatelessWidget {
  final String categorie;
  AdvertsByCategory({@required this.categorie});

  @override
  Widget build(BuildContext context) {
    FavoriteListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteListBloc>(context);
    TabBarBloc _tabBarBloc = BlocProvider.of<TabBarBloc>(context);
    return DefaultTabController(
      length: Strings.categoriesList.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Loook',
            style: TextStyle(letterSpacing: 6),
          ),
          centerTitle: true,
          actions: [
            SearchIcon(),
            Filter(),
          ],
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuerySize.height(context) * 0.065),
            child: BlocBuilder<TabBarBloc, TabBarStates>(
              builder: (context, state) {
                if (state is SubCategoriesTabBarState)
                  return TabBar(
                      isScrollable: true,
                      tabs: state.subCategoriesList
                          .map((e) => Tab(
                                text: e,
                              ))
                          .toList());
                return CategoriesTabBar();
              },
            ),
          ),
        ),
        body: TabBarView(
            children: Strings.categoriesList
                .map((e) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      if (index == 8) {
                        _tabBarBloc.add(SubCategoriesTabBarEvent());
                      }
                      return Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: MediaQuerySize.width(context) * 0.43,
                                child: AspectRatio(
                                  aspectRatio: 4 / 4.5,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        'https://24tv.ua/resources/photos/news/1200x675_DIR/202011/1467558.jpg?202011105451',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              BlocBuilder<FavoriteListBloc, FavoriteListStates>(
                                  builder: (context, state) {
                                if (state is AdvertLikedState) if (state
                                        .index ==
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
                              })
                            ],
                          ),
                          Container(
                            width: MediaQuerySize.width(context) * 0.4,
                            child: Text(
                              'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ));
                    }))
                .toList()),
      ),
    );
  }
}
