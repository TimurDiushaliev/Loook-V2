import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/app/app.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/authentication_widgets/sign_in_page/navigate_to_sign_up_action_button.dart';
import 'package:loook/widgets/authentication_widgets/sign_in_page/sign_in_action_button.dart';
import 'package:loook/widgets/authentication_widgets/sign_in_page/sign_in_inputs.dart';
import 'package:loook/widgets/authentication_widgets/authentication_pages_title.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final List<GlobalKey<FormState>> formKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BlocListener<AuthenticationBloc, AuthenticationStates>(
        listener: (context, state) {
          if (state is SignInProcessingState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.black,
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                        width: ResponsiveSizeProvider.width(context) * 0.1),
                    Text(
                      'Обработка аутентификации',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )));
          }
          if (state is SignInUserState) {
            if (state.userState == 'Signed in successfully') {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => App()));
            }
            if (state.userState == 'Such a user is not exist') {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Пользователя с таким именем не существует')));
            }
          }
          if (state is AuthenticationErrorState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ошибка аутентификации!')));
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xFF252837),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.3,
              ),
              AuthenticationPagesTitle(),
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.05,
              ),
              SignInInputs(
                username: username,
                password: password,
                formKey: formKey[0],
              ),
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.06,
              ),
              SignInActionButton(
                username: username,
                password: password,
                formKey: formKey,
              ),
              SizedBox(
                height: ResponsiveSizeProvider.height(context) * 0.1,
              ),
              NavigateToSignUpActionButton(
                formKey: formKey[1],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
