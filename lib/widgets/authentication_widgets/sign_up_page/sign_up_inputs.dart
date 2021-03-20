import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SignUpInputs extends StatelessWidget {
  final TextEditingController username;
  final TextEditingController password;
  SignUpInputs({@required this.username, @required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveSizeProvider.width(context) * 0.05,
          right: ResponsiveSizeProvider.width(context) * 0.05),
      child: Column(
        children: [
          TextField(
            controller: username,
            decoration: InputDecoration(
              hintText: 'Ваше имя',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: 'Ваш пароль',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
