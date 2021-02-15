import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        color: Colors.purple[800],
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(20),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(
                        'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Путин',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
