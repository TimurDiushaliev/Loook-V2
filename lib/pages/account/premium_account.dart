import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/pages/account/vip_page.dart';
import 'package:loook/bloc/vip_page_bloc/vip_page_bloc.dart';

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
            BlocProvider(create: (context)=> VipPageBloc(2),child: VipPage()),
            Center(child: Text('ELITE')),
            Center(child: Text('GOLD')),
          ],
        ),
      ),
    );
  }
}
