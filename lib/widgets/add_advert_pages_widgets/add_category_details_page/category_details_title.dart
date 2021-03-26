import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';

class CategoryDetailsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
      builder: (context, state) {
        return state is CategoryDetailsFetchedState ? Text(state.key) : '';
      },
    );
  }
}
