import 'package:flutter/material.dart';
import 'package:loook/widgets/info_page/info_description.dart';
import 'package:loook/widgets/info_page/info_image.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
          ),
          IconButton(
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          InfoImage(),
          InfoDescription(),
        ],
      ),
    );
  }
}
