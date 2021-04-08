import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/pages/home/advert_details_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/styles/home_page_style.dart';

class Adverts extends StatelessWidget {
  final int categoryIndex;
  final List<dynamic> adverts;
  Adverts({@required this.adverts, @required this.categoryIndex});
  @override
  Widget build(BuildContext context) {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AdvertDetailsPage(id: adverts[index].id)));
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
                  IconButton(
                    icon: Icon(
                      adverts[index].isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      BlocProvider.of<AdvertDetailsBloc>(context)
                          .add(LikeAdvertEvent(id: adverts[index].id));
                    },
                  ),
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
