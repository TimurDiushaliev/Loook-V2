import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsSocialNetworkIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveSizeProvider.width(context) * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: ResponsiveSizeProvider.height(context) * 0.1,
            width: ResponsiveSizeProvider.width(context) * 0.1,
            child: SvgPicture.asset(
              'images/social_network_icons/instagram_icon.svg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: ResponsiveSizeProvider.height(context) * 0.1,
              width: ResponsiveSizeProvider.width(context) * 0.1,
              child: SvgPicture.asset(
                'images/social_network_icons/telegram_icon.svg',
                fit: BoxFit.contain,
              )),
          Container(
              height: ResponsiveSizeProvider.height(context) * 0.1,
              width: ResponsiveSizeProvider.width(context) * 0.1,
              child: SvgPicture.asset(
                'images/social_network_icons/whatsapp_icon.svg',
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}
