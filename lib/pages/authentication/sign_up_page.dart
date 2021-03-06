import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/authentication_widgets/authentication_pages_title.dart';
import 'package:loook/widgets/authentication_widgets/sign_up_page/sign_up_action_button.dart';
import 'package:loook/widgets/authentication_widgets/sign_up_page/sign_up_check_box.dart';
import 'package:loook/widgets/authentication_widgets/sign_up_page/sign_up_inputs.dart';

class SignUpPage extends StatefulWidget {
  final formKey;
  SignUpPage({@required this.formKey});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController phoneCode = TextEditingController(text: '996');

  final TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252837),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.2,
          ),
          AuthenticationPagesTitle(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.1,
          ),
          SignUpInputs(
            username: username,
            password: password,
            formKey: widget.formKey,
            phoneCode: phoneCode,
            phoneNumber: phoneNumber,
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.03,
          ),
          SignUpCheckBox(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          SignUpActionButton(
            username: username,
            password: password,
            phoneCode: phoneCode,
            phoneNumber: phoneNumber,
            formKey: widget.formKey,
          ),
        ],
      ),
    );
  }
}
