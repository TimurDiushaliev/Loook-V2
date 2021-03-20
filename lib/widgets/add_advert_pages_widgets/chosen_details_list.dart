import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class ChosenDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveSizeProvider.height(context) * 0.05,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: ResponsiveSizeProvider.width(context) * 0.05,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('details'),
            ),
          );
        },
      ),
    );
  }
}
