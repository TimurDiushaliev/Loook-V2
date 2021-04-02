import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AccountInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountAdvertsBloc, AccountAdvertsStates>(
      builder: (context, state) {
        if (state is AccountAdvertsFetchedState) {
          return Container(
            margin: EdgeInsets.only(
                top: ResponsiveSizeProvider.height(context) * 0.05,
                left: ResponsiveSizeProvider.width(context) * 0.1),
            child: Row(
              children: [
                Container(
                  height: ResponsiveSizeProvider.height(context) * 0.1,
                  width: ResponsiveSizeProvider.width(context) * 0.15,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.buro247.ua/thumb/670x830_0/images/2021/01/elon-musk-now-richest-person-01.jpg',
                    ),
                  ),
                ),
                Container(
                  height: ResponsiveSizeProvider.height(context) * 0.1,
                  margin: EdgeInsets.only(
                      left: ResponsiveSizeProvider.width(context) * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Иванов Иван',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Дата регистрации: 12.12.1212'),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
