import 'package:flutter/material.dart';

class AccountBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kTextTabBarHeight;
    final _width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(_height * 0.08),
                child: AppBar(
                  bottom: TabBar(
                    indicatorColor: Colors.red,
                    tabs: [
                      Text('Активные'),
                      Text('Неактивные'),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  GridView.builder(
                      controller: scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: _height * 0.01,
                              horizontal: _width * 0.05),
                          child: Column(
                            children: [
                              Card(
                                color: Colors.grey[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'images/watch.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text(
                                          'Продаю часы от Apple оптом дешевле',
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)),
                                  color: Colors.red[600],
                                  child: Text('Улучшить'),
                                  onPressed: () {})
                            ],
                          ),
                        );
                      }),
                  GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Card(
                              color: Colors.grey[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'images/watch.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: Text(
                                        'Продаю часы от Apple оптом дешевле',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
