import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/widgets/account_page/account_active_adverts.dart';
import 'package:loook/widgets/account_page/account_not_active_adverts.dart';

class AccountBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuerySize.height(context) * 0.1),
                child: AppBar(
                  bottom: TabBar(
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.red,
                    tabs: [
                      Tab(text: 'Активные'),
                      Tab(text: 'Неактивные'),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  AccountActiveAdverts(scrollController: scrollController),
                  AccountNotActiveAdverts(scrollController: scrollController),
                ],
              ),
            ),
          );
        });
  }
}
