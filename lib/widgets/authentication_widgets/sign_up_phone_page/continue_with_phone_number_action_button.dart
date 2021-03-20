import 'package:flutter/material.dart';
import 'package:loook/pages/authentication/sign_up_page.dart';

class ContinueWithPhoneNumberActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpPage(),
        ),
      ),
      color: Colors.white,
      child: Text(
        'Продолжить',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
