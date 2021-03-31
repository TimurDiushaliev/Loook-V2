import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class ChosedDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChosedDetailsBloc, ChosedDetailsStates>(
      builder: (context, state) {
        if (state is ChosedDetailsListState) {
          return Container(
            height: ResponsiveSizeProvider.height(context) * 0.05,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.chosedDetailsList.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: ResponsiveSizeProvider.width(context) * 0.05,
                );
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              ResponsiveSizeProvider.width(context) * 0.05),
                      child: Text(state.chosedDetailsList[index].toString()),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
