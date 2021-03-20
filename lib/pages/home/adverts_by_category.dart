import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';
import 'package:loook/bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_bloc.dart';
import 'package:loook/bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_events.dart';
import 'package:loook/bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/values/strings.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/home_page_widgets/home_page/categories_tab_bar.dart';
import 'package:loook/widgets/home_page_widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page_widgets/home_page/search.dart';

class AdvertsByCategory extends StatelessWidget {
  final String categorie;
  AdvertsByCategory({@required this.categorie});

  @override
  Widget build(BuildContext context) {
    FavoriteListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteListBloc>(context);
    SubCategoriesTabBarBloc _subCategoriesTabBarBloc =
        BlocProvider.of<SubCategoriesTabBarBloc>(context);
    return DefaultTabController(
      length: Strings.categoriesList.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: AppBarTitle(),
          centerTitle: true,
          actions: [
            SearchIcon(),
            Filter(),
          ],
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(ResponsiveSizeProvider.height(context) * 0.065),
            child:
                BlocBuilder<SubCategoriesTabBarBloc, SubCategoriesTabBarStates>(
              builder: (context, state) {
                if (state is SubCategoriesTabBarState)
                  return TabBar(
                      isScrollable: true,
                      tabs: state.subCategoriesList
                          .map((e) => Tab(
                                text: e,
                              ))
                          .toList());
                if (state is CategoriesTabBarState) return CategoriesTabBar();
                return CategoriesTabBar();
              },
            ),
          ),
        ),
        body: TabBarView(
            children: Strings.categoriesList
                .map((e) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.65, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      if (index == 10)
                        _subCategoriesTabBarBloc
                            .add(SubCategoriesTabBarEvent());
                      if (index == 0) if (e == Strings.categoriesList[0])
                        _subCategoriesTabBarBloc.add(CategoriesTabBarEvent());
                      return Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: ResponsiveSizeProvider.width(context) *
                                    0.43,
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
                            width: ResponsiveSizeProvider.width(context) * 0.4,
                            child: Text(
                              'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text(
                            '312 KGS',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ));
                    }))
                .toList()),
      ),
    );
  }
}
