import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/check_box_bloc/check_box_bloc.dart';
import 'package:loook/pages/authentication/sign_up_page.dart';

class NavigateToSignUpActionButton extends StatelessWidget {
  final formKey;
  NavigateToSignUpActionButton({@required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => CheckBoxBloc(false),
                  child: SignUpPage(formKey: formKey)),
            ),
          );
        },
        child: Text(
          'Зарегистрироваться?',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
