import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';

class AccountActiveAdverts extends StatelessWidget {
  final scrollController;
  AccountActiveAdverts({@required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuerySize.width(context) * 0.43,
                height: MediaQuerySize.height(context) * 0.3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://24tv.ua/resources/photos/news/1200x675_DIR/202011/1467558.jpg?202011105451',
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                width: MediaQuerySize.width(context) * 0.4,
                child: Text(
                  'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.red[600],
                  child: Text('Улучшить'),
                  onPressed: () {})
            ],
          ));
        });
  }
}
