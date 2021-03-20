import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AddPriceTextFieldAndCurrencyDropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: ResponsiveSizeProvider.width(context) * 0.7,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(2147483647)],
            decoration: InputDecoration(hintText: 'Цена'),
          ),
        ),
        Container(
          child: DropdownButton(
            value: 1,
            onChanged: (index) {
              print('$index');
            },
            items: [
              DropdownMenuItem(value: 1, child: Text('KGS')),
              DropdownMenuItem(value: 2, child: Text('USD')),
            ],
          ),
        ),
      ],
    );
  }
}
