import 'package:flutter/material.dart';
import 'package:loook/pages/info.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoPage()));
              },
              child: Card(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
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
                              color: Color(0x016AFD).withOpacity(0.4),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0))),
                          child: Center(
                            child: Text(
                              '200 сом',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Часы',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('Новый часты rollex',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
