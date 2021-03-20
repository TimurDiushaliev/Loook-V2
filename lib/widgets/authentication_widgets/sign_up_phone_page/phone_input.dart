import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController controller;
  PhoneInput({@required this.controller});
  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.15,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: Text('+'),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.6,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}