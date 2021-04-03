import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsDescription extends StatelessWidget {
  final String description;
  AdvertDetailsDescription({@required this.description});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width * 0.9,
      margin:
          EdgeInsets.only(left: ResponsiveSizeProvider.width(context) * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Описание:',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Text(
            '$description',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
