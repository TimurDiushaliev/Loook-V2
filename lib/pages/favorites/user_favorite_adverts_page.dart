import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/main_floating_action_button/main_floating_action_button.dart';

class UserFavoriteAdvertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteAdvertsListBloc _favoriteListBloc =
        BlocProvider.of<FavoriteAdvertsListBloc>(context)
          ..add(FetchFavoriteAdvertsListEvent());
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
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
              child: Text(
                'Избранные:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            SizedBox(height: ResponsiveSizeProvider.height(context) * 0.025),
            BlocBuilder<FavoriteAdvertsListBloc, FavoriteAdvertsListStates>(
              builder: (context, state) {
                if (state is FavoriteAdvertsListFetchedState)
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveSizeProvider.width(context) * 0.025),
                    child: GridView.builder(
                      itemCount: state.favoriteAdverts.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
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
                                        state.favoriteAdverts[index].images
                                                .isNotEmpty
                                            ? Image.network(
                                                state.favoriteAdverts[index]
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
                              Text('${state.favoriteAdverts[index].title}',
                                  style: TextStyle(color: Colors.black)),
                              Text(
                                  '${state.favoriteAdverts[index].price}' +
                                      ' ${state.favoriteAdverts[index].currency}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
        floatingActionButton: MainFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
