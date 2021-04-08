import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AccountBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountAdvertsBloc, AccountAdvertsStates>(
      builder: (context, state) {
        if (state is AccountAdvertsFetchedState) {
          return Container(
            margin: EdgeInsets.only(
                top: ResponsiveSizeProvider.height(context) * 0.07),
            child: Column(
              children: [
                Text('${state.accountAdverts.length}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('Объявлений', style: TextStyle(fontSize: 15)),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
