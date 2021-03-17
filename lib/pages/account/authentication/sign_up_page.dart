import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/services/hex_color_converter.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController(text: '996');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        backgroundColor: HexColorConverter.hexToColor('#252837'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: ResponsiveSizeProvider.width(context) * 0.15,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: Text('+'),
                      prefixIconConstraints:
                          BoxConstraints(minWidth: 0, minHeight: 0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: ResponsiveSizeProvider.width(context) * 0.6,
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveSizeProvider.height(context) * 0.05,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              onPressed: () {},
              color: Colors.white,
              child: Text(
                'Продолжить',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
