import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AddDescriptionTextFields extends StatelessWidget {
  const AddDescriptionTextFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ResponsiveSizeProvider.width(context) * 0.9,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
            inputFormatters: [LengthLimitingTextInputFormatter(250)],
            decoration: InputDecoration(hintText: 'Заголовок'),
          ),
        ),
        SizedBox(
          height: ResponsiveSizeProvider.height(context) * 0.05,
        ),
        Container(
          width: ResponsiveSizeProvider.width(context) * 0.9,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
            decoration: InputDecoration(hintText: 'Описание'),
          ),
        ),
      ],
    );
  }
}
