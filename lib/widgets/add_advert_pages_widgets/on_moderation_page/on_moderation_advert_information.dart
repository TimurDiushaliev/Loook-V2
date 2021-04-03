import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class OnModerationAdvertInformation extends StatelessWidget {
  final Map<String, dynamic> fields;
  OnModerationAdvertInformation({@required this.fields});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: _height * 0.1, left: _width * 0.05),
          child: Text(
            'Информация:',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: ResponsiveSizeProvider.height(context) * 0.05,
        ),
        Container(
          margin: EdgeInsets.only(
              left: ResponsiveSizeProvider.width(context) * 0.06,
              right: ResponsiveSizeProvider.width(context) * 0.06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: fields.keys
                    .map<Widget>((e) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ResponsiveSizeProvider.height(context) *
                                  0.01),
                          child: Text('$e:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ))
                    .toList(),
              ),
              Container(
                child: Column(
                  children: fields.values
                      .map<Widget>((e) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    ResponsiveSizeProvider.height(context) *
                                        0.01),
                            child: Text('$e',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
