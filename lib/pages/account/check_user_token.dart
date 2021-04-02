import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/pages/account/account_page.dart';
import 'package:loook/pages/authentication/sign_in_page.dart';
import 'package:loook/pages/authentication/sign_up_page.dart';

class CheckUserToken extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        if (state is SignedInState) if (Hive.box('tokensBox')
                .get('accessToken') !=
            null) return AccountPage();
        return SignInPage();
      },
    );
  }
}
