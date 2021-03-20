import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SignInActionButton extends StatelessWidget {
  final TextEditingController username;
  final TextEditingController password;
  SignInActionButton({@required this.username, @required this.password});
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Container(
      width: ResponsiveSizeProvider.width(context) * 1,
      child: Align(
        alignment: Alignment.center,
        child: MaterialButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Colors.white),
          ),
          child: Text(
            'Войти',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            _authenticationBloc.add(
              SignInEvent(username: username.text, password: password.text),
            );
          },
        ),
      ),
    );
  }
}
