import 'package:flutter/material.dart';
import 'package:loook/pages/info_page.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 2 / 3,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InfoPage()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey,
                    child: Image.network(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text('Продаю Путина'),
                  Text(
                    '50 KGS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Бишкек',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
