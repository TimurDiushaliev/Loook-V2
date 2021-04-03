import 'package:flutter/material.dart';
import 'package:loook/widgets/add_advert_pages_widgets/on_moderation_page/on_moderation_advert_bottom_sheet.dart';
import 'package:loook/widgets/add_advert_pages_widgets/on_moderation_page/on_moderation_advert_images.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';

class OnModerationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          OnModerationAdvertImages(),
          OnModerationAdvertBottomSheet(),
        ],
      ),
    );
  }
}
