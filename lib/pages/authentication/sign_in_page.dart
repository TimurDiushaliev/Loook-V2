import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/authentication_widgets/sign_in_page/navigate_to_sign_up_action_button.dart';
import 'package:loook/widgets/authentication_widgets/sign_in_page/sign_in_action_button.dart';
import 'package:loook/widgets/authentication_widgets/sign_in_page/sign_in_inputs.dart';
import 'package:loook/widgets/authentication_widgets/authentication_pages_title.dart';
import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/main_floating_action_button/main_floating_action_button.dart';

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
      home: Scaffold(
        backgroundColor: Color(0xFF252837),
        appBar: AppBar(
          backgroundColor: Color(0xFF252837),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ResponsiveSizeProvider.height(context) * 0.2,
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
              height: ResponsiveSizeProvider.height(context) * 0.2,
            ),
            NavigateToSignUpActionButton(
              formKey: formKey[1],
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MainFloatingActionButton(),
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
