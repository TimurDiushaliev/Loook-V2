import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_description_page/add_description_text_fields.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_description_page/autofill_switch_and_navigation_buttons.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';


class AddDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          ChosenDetailsList(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.1,
          ),
          AutoFillSwitchAndNavigationButton(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.1,
          ),
          AddDescriptionTextFields(),
        ],
      ),
    );
  }
}
