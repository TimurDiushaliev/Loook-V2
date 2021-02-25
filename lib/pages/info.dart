import 'package:flutter/material.dart';
import 'package:loook/widgets/info/bottom_information_sheet.dart';
import 'package:loook/widgets/info/information_image.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          InformationImage(),
          BottomInformationSheet(),
        ],
      ),
    );
  }
}
