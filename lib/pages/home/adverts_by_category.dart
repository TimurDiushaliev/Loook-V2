import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/app/app.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/pages/home/advert_details_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';

class AdvertsByCategory extends StatelessWidget {
  final String category;
  final int categoryIndex;
  AdvertsByCategory({@required this.category, @required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AdvertDetailsBloc>(context).add(FetchCategoriesListEvent());
    return BlocConsumer<AdvertDetailsBloc, AdvertDetailsStates>(
      listener: (context, state) {
        if (state is CategoriesListNotFetchedState) {
          BlocProvider.of<AdvertDetailsBloc>(context)
              .add(FetchCategoriesListEvent());
        }
      },
      builder: (context, state) {
        if (state is CategoriesListFetchedState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: AppBarTitle(),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                SizedBox(
                    height: ResponsiveSizeProvider.height(context) * 0.025),
                Container(
                  margin: EdgeInsets.only(
                      left: ResponsiveSizeProvider.width(context) * 0.05),
                  child: Text('$category',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                SizedBox(
                    height: ResponsiveSizeProvider.height(context) * 0.025),
                GridView.builder(
                  itemCount:
                      state.categoriesDetailsList[categoryIndex].adverts.length,
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdvertDetailsPage(
                                            id: state
                                                .categoriesDetailsList[
                                                    categoryIndex]
                                                .adverts[index]
                                                .id)));
                              },
                              child: Container(
                                width: ResponsiveSizeProvider.width(context) *
                                    0.43,
                                child: AspectRatio(
                                  aspectRatio: 4 / 4.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: state
                                            .categoriesDetailsList[
                                                categoryIndex]
                                            .adverts[index]
                                            .images
                                            .isNotEmpty
                                        ? Image.network(
                                            state
                                                .categoriesDetailsList[
                                                    categoryIndex]
                                                .adverts[index]
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
                            ),
                            IconButton(
                              icon: Icon(
                                state.categoriesDetailsList[categoryIndex]
                                        .adverts[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                BlocProvider.of<AdvertDetailsBloc>(context).add(
                                    LikeAdvertEvent(
                                        id: state
                                            .categoriesDetailsList[
                                                categoryIndex]
                                            .adverts[index]
                                            .id));

                                print(state.categoriesDetailsList[categoryIndex]
                                    .adverts[index].isFavorite);
                              },
                            )
                          ],
                        ),
                        Container(
                          width: ResponsiveSizeProvider.width(context) * 0.4,
                          child: Text(
                            '${state.categoriesDetailsList[categoryIndex].adverts[index].title}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text(
                          '${state.categoriesDetailsList[categoryIndex].adverts[index].price}' +
                              ' ${state.categoriesDetailsList[categoryIndex].adverts[index].currency}',
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
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
