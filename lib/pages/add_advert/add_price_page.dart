import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_price_page/add_advert_action_button.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_price_page/add_price_text_field_and_currency_dropdown_button.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_price_page/add_price_title_and_navigation_button.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddPricePage extends StatelessWidget {
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
          AddPriceTitleAndNavigationButton(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          AddPriceTextFieldAndCurrencyDropDownButton(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.15,
          ),
          AddAdvertActionButton(),
        ],
      ),
    );
  }
}