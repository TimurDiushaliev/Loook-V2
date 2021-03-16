import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/vip_page_bloc/vip_page_bloc.dart';
import 'package:loook/pages/account/vip_page.dart';


class PremiumAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                text: 'VIP',
              ),
              Tab(
                text: 'ELITE',
              ),
              Tab(
                text: 'GOLD',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
             VipPage(),
            Center(child: Text('ELITE')),
            Center(child: Text('GOLD')),
          ],
        ),
      ),
    );
  }
}
