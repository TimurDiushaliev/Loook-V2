import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SignUpInputs extends StatelessWidget {
  final formKey;
  final TextEditingController username;
  final TextEditingController password;
  final TextEditingController phoneCode;
  final phoneNumber;
  SignUpInputs(
      {@required this.username,
      @required this.password,
      @required this.formKey,
      @required this.phoneCode,
      @required this.phoneNumber});
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
                if (value.length > 150) return 'Не более 150 символов';
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
              obscureText: true,
              validator: (value) {
                if (value.length > 128) return 'Не более 128 символов';
                if (value.isEmpty) return 'Обязательное поле';
              },
              decoration: InputDecoration(
                hintText: 'Ваш пароль',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       width: ResponsiveSizeProvider.width(context) * 0.15,
            //       child: TextFormField(
            //         controller: phoneCode,
            //         validator: (value) {
            //           if (value.length > 3) return '3';
            //         },
            //         decoration: InputDecoration(
            //           prefixIcon: Text('+'),
            //           prefixIconConstraints:
            //               BoxConstraints(minWidth: 0, minHeight: 0),
            //           focusedBorder: UnderlineInputBorder(
            //             borderSide: BorderSide(color: Colors.white),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       width: ResponsiveSizeProvider.width(context) * 0.6,
            //       child: TextFormField(
            //         controller: phoneNumber,
            //         validator: (value) {
            //           if (value.isEmpty) return 'Обязательное поле';
            //           if (value.length != 9) return 'Допустимое число цифр 9';
            //         },
            //         decoration: InputDecoration(
            //           hintText: 'Ваш номер телефона',
            //           focusedBorder: UnderlineInputBorder(
            //             borderSide: BorderSide(color: Colors.white),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
