import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/pages/account/user_page.dart';
import 'package:loook/pages/authentication/sign_in_page.dart';
import 'package:loook/services/user_state.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        if (state is SignedInState) return UserState.checkUserToken(UserPage());
        return SignInPage();
      },
    );
  }
}
