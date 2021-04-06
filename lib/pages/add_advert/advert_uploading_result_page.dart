import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/app/app.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/widgets/app_bar/app_bar_title.dart';


class AdvertUploadingResultPage extends StatelessWidget {
  const AdvertUploadingResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            appBar: AppBar(
              title: AppBarTitle(),
            ),
            body: state is AdvertState
                ? Center(
                    child: Column(
                      children: [
                        Text('${state.advertState}'),
                        MaterialButton(
                          color: Colors.white,
                          child: Text('Вернуться на главную',
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => App()),
                                (route) => false);
                          },
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
