import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SignInInputs extends StatelessWidget {
  final TextEditingController username;
  final TextEditingController password;
  final formKey;
  SignInInputs(
      {@required this.username,
      @required this.password,
      @required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveSizeProvider.width(context) * 0.05,
          right: ResponsiveSizeProvider.width(context) * 0.05),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: username,
              validator: (value) {
                if (value.isEmpty) return 'Обязательное поле';
              },
              decoration: InputDecoration(
                hintText: 'Ваше имя',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
              controller: password,
              validator: (value) {
                if (value.isEmpty) return 'Обязательное поле';
              },
              decoration: InputDecoration(
                hintText: 'Ваш пароль',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
