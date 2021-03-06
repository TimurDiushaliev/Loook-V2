import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_evets.dart';
import 'package:loook/bloc/account_page_blocs/account_adverts_bloc/account_adverts_states.dart';
import 'package:loook/repository/adverts_repository.dart';

class AccountAdvertsBloc
    extends Bloc<AccountAdvertsEvents, AccountAdvertsStates> {
  AccountAdvertsBloc(AccountAdvertsStates initialState) : super(initialState);

  @override
  Stream<AccountAdvertsStates> mapEventToState(
      AccountAdvertsEvents event) async* {
    if (event is FetchAccountAdvertsEvent) {
      try {
        List<dynamic> accountAdverts = await AdvertsRepository.accountAdverts;
        if (accountAdverts != null) {
          yield AccountAdvertsFetchedState(accountAdverts: accountAdverts);
        } else {
          yield TokenRefreshedState();
        }
      } catch (_) {
        FetchingAccountAdvertsFailedState();
      }
    }
  }
}
