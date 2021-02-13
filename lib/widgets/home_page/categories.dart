import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: Colors.purple[800],
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg'),
                )),
            Container(
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg'),
                )),
            Container(
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg'),
                )),
            Container(
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg'),
                )),
            Container(
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg'),
                )),
            Container(
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg'),
                )),
          ],
        ));
  }
}
