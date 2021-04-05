import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/check_box_bloc/check_box_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_events.dart';
import 'package:loook/pages/authentication/sign_in_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SignUpActionButton extends StatelessWidget {
  final formKey;
  final TextEditingController username;
  final TextEditingController password;
  final TextEditingController phoneCode;
  final TextEditingController phoneNumber;
  SignUpActionButton(
      {@required this.username,
      @required this.password,
      @required this.phoneCode,
      @required this.phoneNumber,
      @required this.formKey});
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return BlocBuilder<CheckBoxBloc, bool>(builder: (context, state) {
      return Container(
        width: ResponsiveSizeProvider.width(context) * 1,
        child: Align(
          alignment: Alignment.center,
          child: MaterialButton(
            color: state ? Colors.white : Colors.grey[500],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(color: Colors.white),
            ),
            child: Text(
              'Зарегистрироваться',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              if (state) {
                if (formKey.currentState.validate()) {
                  _authenticationBloc.add(
                    SignUpEvent(
                        username: username.text,
                        password: password.text,
                        phoneNumber: '+' + phoneCode.text + phoneNumber.text),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                }
              } else
                return null;
            },
          ),
        ),
      );
    });
  }
}
