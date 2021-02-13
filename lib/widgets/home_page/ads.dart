import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  child: Image.network(
                      'https://roscongress.org/upload/resize_cache/iblock/a9b/289_289_2/111426.htm.jpg'),
                ),
                Text('Продаю Путина'),
                Text('50 KGS', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('Бишкек', style: TextStyle(color: Colors.grey),),
              ],
            ),
          );
        },
      ),
    );
  }
}
