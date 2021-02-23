import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          'https://aliradar.com/api/image?url=https%3A%2F%2Fae01.alicdn.com%2Fkf%2FH680d4a0396fe4ce682bfeeca0a12f983M%2FSINOBI-Top-Sale-Men-Wrist-Watches-Luminous-Pointer-Stainless-Steel-Watchband-Luxury-Brand-Male-Sports-Geneva.jpg_640x640.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 110,
                      margin: EdgeInsets.only(
                        left: 70,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0))),
                      child: Center(
                        child: Text(
                          '200 KGS',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 10), child: Text('Часы')),
              ],
            ),
          );
        });
  }
}
