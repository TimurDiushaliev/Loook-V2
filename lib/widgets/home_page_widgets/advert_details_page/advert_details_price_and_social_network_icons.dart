import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AdvertDetailsPriceAndSocialNetworkIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: ResponsiveSizeProvider.width(context) * 0.1),
                                child: Text(
                                  '230 KGS',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: ResponsiveSizeProvider.width(context) * 0.25,
                              ),
                              Container(
                                width: ResponsiveSizeProvider.width(context) * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: ResponsiveSizeProvider.height(context)* 0.1,
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
                              )
                            ],
                          );
  }
}