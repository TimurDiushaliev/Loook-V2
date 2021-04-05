import 'package:flutter/material.dart';

class AdvertDetailsOwnerName extends StatelessWidget {
  final String ownername;
  AdvertDetailsOwnerName({@required this.ownername});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Владелец:',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text('$ownername',
              style: TextStyle(color: Colors.black, fontSize: 17)),
        ],
      ),
    );
  }
}
