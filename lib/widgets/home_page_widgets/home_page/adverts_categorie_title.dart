import 'package:flutter/material.dart';
import 'package:loook/pages/home/adverts_by_category.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/styles/home_page_style.dart';
import 'package:loook/values/strings.dart';

class AdvertsByCategorieTitle extends StatelessWidget {
  final int index;
  AdvertsByCategorieTitle({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: ResponsiveSizeProvider.width(context) * 0.05,
            top: ResponsiveSizeProvider.height(context) * 0.03,
            bottom: ResponsiveSizeProvider.height(context) * 0.03,
          ),
          child: Text(Strings.categoriesList[index],
              style: HomePageStyle.categoriesTextStyle),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdvertsByCategory(
                  categorie: Strings.categoriesList[index],
                ),
              ),
            );
          },
          child: Container(
            margin:
                EdgeInsets.only(right: ResponsiveSizeProvider.width(context) * 0.08),
            child: Text(
              'Выбрать',
              style: HomePageStyle.chooseTextButtonStyle,
            ),
          ),
        )
      ],
    );
  }
}
