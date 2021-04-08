import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_evets.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/pages/account/premium_account_page.dart';

class AccountActiveAdverts extends StatelessWidget {
  final scrollController;
  AccountActiveAdverts({@required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountAdvertsBloc, AccountAdvertsStates>(
      listener: (context, state) {
        if (state is TokenRefreshedState) {
          BlocProvider.of<AccountAdvertsBloc>(context)
              .add(FetchAccountAdvertsEvent());
        }
      },
      builder: (context, state) {
        if (state is AccountAdvertsFetchedState) {
          return GridView.builder(
            itemCount: state.accountAdverts.length,
            controller: scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6, crossAxisCount: 2),
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
                          child: state.accountAdverts[index].images.isNotEmpty
                              ? Image.network(
                                  state.accountAdverts[index].images[0]['file'],
                                  fit: BoxFit.cover,
                                )
                              :
                              //otherwise return default image
                              Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/488px-No-Image-Placeholder.svg.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Container(
                      width: ResponsiveSizeProvider.width(context) * 0.4,
                      child: Text(
                        state.accountAdverts[index].title,
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PremiumAccountPage()));
                      },
                    )
                  ],
                ),
              );
            },
          );
        }
        return Center(
          child: Text('Здесь пока ничего нет!'),
        );
      },
    );
  }
}
