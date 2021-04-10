import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_states.dart';
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
    return BlocConsumer<AuthenticationBloc, AuthenticationStates>(
      listener: (context, state) {
        if (state is SignUpProcessingState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.black,
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: ResponsiveSizeProvider.width(context) * 0.1),
                  Text(
                    'Обработка аутентификации',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )));
        }
        if (state is SignUpUserState) {
          if (state.userState == 'Signed up successfully') {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Пользователь успешно зарегистрирован',
                ),
              ),
            );
            Navigator.pop(context);
          }
          if (state.userState == 'Such a user already exists') {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Пользователь с таким именем уже существует')));
          }
          if (state.userState == 'Such a phone number already exists') {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Пользователь с номером именем уже существует')));
          }
          if (state.userState == 'Signing up error') {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ошибка аутентификации!')));
          }
        }
        if (state is AuthenticationErrorState) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Ошибка аутентификации!')));
        }
      },
      builder: (context, state) {
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
                    if (!RegExp(r'^[\w.@+-]+$').hasMatch(value))
                      return 'Только латинские буквы, цифры и знаки @/./+/-/_.';
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
                    if (value.length < 8) return 'Минимум 8 символов';
                    if (!RegExp(r'^(?=.*[0-9])(?=.*[a-z])([a-z0-9_-]+)$')
                        .hasMatch(value))
                      return 'Пароль должен содержать и буквы,и цифры';
                  },
                  decoration: InputDecoration(
                    hintText: 'Ваш пароль',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: ResponsiveSizeProvider.width(context) * 0.15,
                      child: TextFormField(
                        controller: phoneCode,
                        validator: (value) {
                          if (value.length < 3) return '3';
                        },
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
                      child: TextFormField(
                        controller: phoneNumber,
                        validator: (value) {
                          if (value.isEmpty) return 'Обязательное поле';
                          if (value.length != 9)
                            return 'Допустимое число цифр 9';
                          if (!RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$')
                              .hasMatch(value)) return 'Допустимы только цифры';
                        },
                        decoration: InputDecoration(
                          hintText: 'Ваш номер телефона',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
