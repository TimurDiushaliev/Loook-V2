import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsViews extends StatelessWidget {
  final int views;
  AdvertDetailsViews({@required this.views});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(right: ResponsiveSizeProvider.width(context) * 0.05),
      child: Row(
        children: [
          Icon(
            Icons.visibility,
            color: Colors.grey[700],
          ),
          Text(
            views < 10000 ? '  $views' : '+9999',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
