import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/authentication_widgets/sign_up_phone_page/continue_with_phone_number_action_button.dart';
import 'package:loook/widgets/authentication_widgets/sign_up_phone_page/phone_input.dart';

class SignUpPhonePage extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: '996');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF252837),
      ),
      backgroundColor: Color(0xFF252837),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhoneInput(controller: controller),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.1,
          ),
          ContinueWithPhoneNumberActionButton()
        ],
      ),
    );
  }
}
