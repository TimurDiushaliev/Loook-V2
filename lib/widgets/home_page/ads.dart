import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  const Ads({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      'index $index',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }),
          );
        });
  }
}
