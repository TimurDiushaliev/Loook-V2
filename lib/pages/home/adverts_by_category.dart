import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/styles/home_page_style.dart';
import 'package:loook/values/strings.dart';
import 'package:loook/widgets/home_page/categories_tab_bar.dart';
import 'package:loook/widgets/home_page/filter.dart';
import 'package:loook/widgets/home_page/search.dart';

class AdvertsByCategory extends StatelessWidget {
  final String categorie;
  const AdvertsByCategory({@required this.categorie});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Strings.categoriesList.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Loook',
            style: TextStyle(letterSpacing: 6),
          ),
          centerTitle: true,
          actions: [
            SearchIcon(),
            Filter(),
          ],
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuerySize.height(context) * 0.065),
            child: CategoriesTabBar(),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuerySize.width(context) * 0.05,
                  top: MediaQuerySize.height(context) * 0.025),
              height: MediaQuerySize.height(context) * 0.1,
              child: Text(
                categorie,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.65, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
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
                          IconButton(
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {})
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuerySize.height(context) * 0.03,
                          bottom: MediaQuerySize.height(context) * 0.02,
                        ),
                        width: MediaQuerySize.width(context) * 0.4,
                        height: MediaQuerySize.height(context) * 0.05,
                        child: Text(
                          'Продаю часы от Apple оптом дешевле fdfsdfdfsfsd',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: HomePageStyle.descriptionTextStyle,
                        ),
                      ),
                      Container(
                        width: MediaQuerySize.width(context) * 0.4,
                        // color: Colors.red,
                        child: Text(
                          '312215 KGS',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: HomePageStyle.priceStyle,
                        ),
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
