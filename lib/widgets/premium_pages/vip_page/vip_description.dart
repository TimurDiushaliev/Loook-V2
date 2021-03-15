import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class VipDescription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
          height: ResponsiveSizeProvider.height(context) * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: ResponsiveSizeProvider.width(context) * 0.7,
                      child: Text(
                        'Больше 100 просмотров за 1 день, а так же возможность поднятия в топ!',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: ResponsiveSizeProvider.width(context) * 0.7,
                      child: Text(
                        'Больше 100 просмотров за 1 день, а так же возможность поднятия в топ!',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: ResponsiveSizeProvider.width(context) * 0.7,
                      child: Text(
                        'Больше 100 просмотров за 1 день, а так же возможность поднятия в топ!',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
  }
}