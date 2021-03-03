import 'package:flutter/material.dart';

class AccountAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(builder: (context, scrollController) {
      return Container(
          color: Colors.white,
          child: Column(
            children: [
              TabBarView(
                children: [
                  GridView.builder(
                      controller: scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6, crossAxisCount: 2),
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.5, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: Container(
                              child: Container(
                            child: Image.asset(
                              'images/watch.png',
                              fit: BoxFit.contain,
                            ),
                          )),
                        );
                      }),
                ],
              ),
            ],
          ));
    });
  }
}
