
import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class OnModerationAdvertTitle extends StatelessWidget {
  final String title;
  OnModerationAdvertTitle({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: ResponsiveSizeProvider.width(context) * 0.1),
      child: Text(
        '$title',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}