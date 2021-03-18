import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loook/bloc/add_advert_pages_blocs/categories_details_bloc/categories_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/categories_details_bloc/categories_details_events.dart';
import 'package:loook/pages/add_advert/categories_details_page.dart';
import 'package:loook/values/strings.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoriesDetailsBloc _categoriesDetailsBloc =
        BlocProvider.of<CategoriesDetailsBloc>(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: Strings.categoriesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _categoriesDetailsBloc.add(CategorieTappedEvent());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesDetailsPage(),
              ),
            );
          },
          child: Card(
            color: Color(0x252837),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Strings.categoriesImages[index]),
                Text(Strings.categoriesList[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
