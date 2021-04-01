import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_events.dart';
import 'package:loook/pages/add_advert/add_media_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class CategoryDetailsList extends StatelessWidget {
  final TextEditingController detailInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    ChosedDetailsBloc _chosedDetailsBloc =
        BlocProvider.of<ChosedDetailsBloc>(context);
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
      builder: (context, state) {
        if (state is CategoryDetailsFetchedState) {
          if (state.values.isNotEmpty) {
            return ListView.builder(
              itemCount: state.values.length,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _chosedDetailsBloc.add(DetailIsChosedEvent(
                        chosedDetail: '${state.key}: ${state.values[index]}'));
                    if (state.categoryDetailsMap.length != state.keyIndex + 1) {
                      _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
                        "fields": {state.key: state.values[index]}
                      }));
                      _advertDetailsBloc.add(FetchNextCategoryDetailsEvent());
                    } else {
                      _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
                        "fields": {state.key: state.values[index]}
                      }));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMediaPage()));
                    }
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(state.values[index].toString()),
                    ),
                  ),
                );
              },
            );
          } else {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveSizeProvider.width(context) * 0.1),
                  child: TextField(
                    controller: detailInputController,
                    decoration: InputDecoration(
                      hintText: '${state.key}',
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveSizeProvider.height(context) * 0.05,
                ),
                MaterialButton(
                  color: Colors.white,
                  child: Text(
                    'Продолжить',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
                      "fields": {state.key: detailInputController.text}
                    }));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMediaPage()));
                  },
                ),
              ],
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
