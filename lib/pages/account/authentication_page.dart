import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_bloc/check_box_bloc.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/services/authentification_provider.dart';
import 'package:loook/services/hex_color_converter.dart';

class AuthenticationPage extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthenticationProvider _authenticationProvider =
      AuthenticationProvider();
  @override
  Widget build(BuildContext context) {
    CheckBoxBloc _checkBoxBloc = BlocProvider.of<CheckBoxBloc>(context);
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        backgroundColor: HexColorConverter.hexToColor('#252837'),
        body: Column(
          children: [
            SizedBox(
              height: ResponsiveSizeProvider.height(context) * 0.3,
            ),
            Text(
              'Loook',
              style: TextStyle(fontSize: 25, letterSpacing: 8),
            ),
            SizedBox(
              height: ResponsiveSizeProvider.height(context) * 0.07,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ResponsiveSizeProvider.width(context) * 0.05,
                  right: ResponsiveSizeProvider.width(context) * 0.05),
              child: Column(
                children: [
                  TextField(
                    controller: _username,
                    decoration: InputDecoration(
                      hintText: 'Ваше имя',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  TextField(
                    controller: _password,
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
            SizedBox(
              height: ResponsiveSizeProvider.height(context) * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: ResponsiveSizeProvider.width(context) * 0.07,
                ),
                BlocBuilder<CheckBoxBloc, bool>(builder: (context, state) {
                  return Checkbox(
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    value: state ? true : false,
                    onChanged: (value) {
                      value
                          ? _checkBoxBloc.add(CheckBoxEvents.checked)
                          : _checkBoxBloc.add(CheckBoxEvents.not_checked);
                    },
                  );
                }),
                Container(
                  width: ResponsiveSizeProvider.width(context) * 0.7,
                  child: Text(
                    'Я принимаю условия пользования сервиса Loook',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveSizeProvider.height(context) * 0.03,
            ),
            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: Colors.white),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveSizeProvider.width(context) * 0.3,
                    right: ResponsiveSizeProvider.width(context) * 0.3),
                child: Text(
                  'Войти',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              onPressed: () {
                _authenticationProvider.signUp(_username.text, _password.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
