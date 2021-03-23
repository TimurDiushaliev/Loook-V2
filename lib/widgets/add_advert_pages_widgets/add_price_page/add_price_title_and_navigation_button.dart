import 'package:flutter/material.dart';
import 'package:loook/pages/add_advert/add_price_page.dart';

class AddPriceTitleAndNavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Укажите цену'),
        // Spacer(),
        // MaterialButton(
        //   shape: RoundedRectangleBorder(
        //       side: BorderSide(color: Colors.white),
        //       borderRadius: BorderRadius.circular(18)),
        //   child: Text(
        //     'Дальше',
        //     style: TextStyle(fontSize: 13),
        //   ),
        // ),
      ],
    );
  }
}
