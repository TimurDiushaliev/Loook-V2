import 'package:flutter/material.dart';
import 'package:loook/pages/authentication/sign_up_phone_page.dart';

class NavigateToSignUpActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPhonePage(),
          ),
        ),
        child: Text(
          'Зарегистрироваться?',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
