import 'package:flutter/material.dart';
import 'package:loook/pages/add_advert/add_description_page.dart';

class AddMediaTitleAndNavigation extends StatelessWidget {
  const AddMediaTitleAndNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Добавьте фото и видео',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Spacer(),
        MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            'Дальше',
            style: TextStyle(fontSize: 13),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDescriptionPage(),
            ),
          ),
        ),
      ],
    );
  }
}
