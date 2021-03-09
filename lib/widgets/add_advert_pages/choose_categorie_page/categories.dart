import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loook/values/strings.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: Strings.categoriesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
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
          );
        });
  }
}
