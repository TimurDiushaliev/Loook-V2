import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loook/responsive_size/media_query.dart';

class SocialNetworkIcons extends StatelessWidget {
  const SocialNetworkIcons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuerySize.width(context) * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuerySize.height(context) * 0.1,
            width: MediaQuerySize.width(context) * 0.1,
            child: SvgPicture.asset(
              'images/social_network_icons/instagram_icon.svg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: MediaQuerySize.height(context) * 0.1,
              width: MediaQuerySize.width(context) * 0.1,
              child: SvgPicture.asset(
                'images/social_network_icons/telegram_icon.svg',
                fit: BoxFit.contain,
              )),
          Container(
              height: MediaQuerySize.height(context) * 0.1,
              width: MediaQuerySize.width(context) * 0.1,
              child: SvgPicture.asset(
                'images/social_network_icons/whatsapp_icon.svg',
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}
