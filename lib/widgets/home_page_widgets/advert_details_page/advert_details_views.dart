import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ResponsiveSizeProvider.height(context) * 0.02,
          left: ResponsiveSizeProvider.width(context) * 0.8,
          right: ResponsiveSizeProvider.width(context) * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.visibility,
            color: Colors.grey[700],
          ),
          Text(
            '13',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
