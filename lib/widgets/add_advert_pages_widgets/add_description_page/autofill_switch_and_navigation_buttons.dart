import 'package:flutter/material.dart';
import 'package:loook/pages/add_advert/add_price_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AutoFillSwitchAndNavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ResponsiveSizeProvider.width(context) * 0.05,
        ),
        Container(
          child: Column(
            children: [
              Text('Автозаполнение'),
              Switch(value: false, onChanged: (a) => true)
            ],
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
              context, MaterialPageRoute(builder: (context) => AddPricePage())),
        ),
        SizedBox(
          width: ResponsiveSizeProvider.width(context) * 0.05,
        ),
      ],
    );
  }
}
