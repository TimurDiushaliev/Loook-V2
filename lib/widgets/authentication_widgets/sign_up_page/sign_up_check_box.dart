import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/check_box_bloc/check_box_bloc.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class SignUpCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckBoxBloc _checkBoxBloc = BlocProvider.of<CheckBoxBloc>(context);
    return Row(
      children: [
        SizedBox(
          width: ResponsiveSizeProvider.width(context) * 0.07,
        ),
        BlocBuilder<CheckBoxBloc, bool>(builder: (context, state) {
          return Checkbox(
            activeColor: Colors.white,
            checkColor: Colors.black,
            value: state ? true : false,
            onChanged: (value) {
              value
                  ? _checkBoxBloc.add(CheckBoxEvents.checked)
                  : _checkBoxBloc.add(CheckBoxEvents.not_checked);
            },
          );
        }),
        Container(
          width: ResponsiveSizeProvider.width(context) * 0.7,
          child: Text(
            'Я принимаю условия пользования сервиса Loook',
          ),
        ),
      ],
    );
  }
}
