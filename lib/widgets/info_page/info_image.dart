import 'package:flutter/material.dart';

class InfoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
