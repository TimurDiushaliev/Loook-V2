import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_by_id_bloc/advert_by_id_events.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_bottom_sheet.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_images.dart';
import 'package:loook/widgets/home_page_widgets/advert_details_page/advert_details_phones.dart';

class AdvertDetailsPage extends StatelessWidget {
  final int id;
  AdvertDetailsPage({@required this.id});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AdvertByIdBloc>(context).add(FetchAdvertByIdEvent(id: id));
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            AdvertDetailsImages(),
            AdvertDetailsBottomSheet(id: id),
          ],
        ),
        floatingActionButton: AdvertDetailsPhones());
  }
}
