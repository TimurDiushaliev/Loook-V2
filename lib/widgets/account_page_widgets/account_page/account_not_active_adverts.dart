import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AccountNotActiveAdverts extends StatelessWidget {
  final scrollController;
  const AccountNotActiveAdverts({@required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.43,
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://crimeandrelativedimensioninspace.files.wordpress.com/2020/11/queens-gambit-chess-player-review.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Container(
                width: ResponsiveSizeProvider.width(context) * 0.4,
                child: Text(
                  'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ));
        });
  }
}
