import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AdvertDetailsPhones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: Icons.phone,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.green,
              labelBackgroundColor: Colors.green,
              label: '0779151515',
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.megacom.kg/uploads/ckeditor/pictures/1665/content_ru_Исходники.png',
                ),
              )),
          SpeedDialChild(
              backgroundColor: Colors.pink,
              labelBackgroundColor: Colors.pink[400],
              label: '0709151515',
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Logo_O%21.png/200px-Logo_O%21.png',
                ),
              )),
          SpeedDialChild(
            backgroundColor: Colors.yellow,
            labelBackgroundColor: Colors.yellow[900],
            label: '0555151515',
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://knews.kg/wp-content/uploads/2017/07/2016-04-22_17-40-02_561856.jpg',
              ),
            ),
          ),
        ],
      );
  }
}