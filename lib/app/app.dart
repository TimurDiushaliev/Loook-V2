import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_bloc.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/pages/authentication/sign_in_page.dart';
import 'package:loook/route/main_route.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Hive.box('tokensBox').get('accessToken') != null) {
      return MaterialApp(home: MainRoute());
    }
    return MaterialApp(
        home: BlocProvider(
            create: (context) => AuthenticationBloc(NotAuthenticatedState()),
            child: SignInPage()));
  }
}
