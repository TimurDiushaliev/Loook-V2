import 'package:flutter/material.dart';

class InformationImage extends StatelessWidget {
  const InformationImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 1000,
      child: Image.network(
        'https://aliradar.com/api/image?url=https%3A%2F%2Fae01.alicdn.com%2Fkf%2FH680d4a0396fe4ce682bfeeca0a12f983M%2FSINOBI-Top-Sale-Men-Wrist-Watches-Luminous-Pointer-Stainless-Steel-Watchband-Luxury-Brand-Male-Sports-Geneva.jpg_640x640.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
