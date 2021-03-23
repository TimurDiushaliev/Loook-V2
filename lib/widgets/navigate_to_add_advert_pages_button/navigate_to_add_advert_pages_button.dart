import 'package:flutter/material.dart';
import 'package:loook/pages/add_advert/advert_details_page.dart';

class NavigateToAddAdvertPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdvertDetailsPage(),
            ),
          );
        });
  }
}
