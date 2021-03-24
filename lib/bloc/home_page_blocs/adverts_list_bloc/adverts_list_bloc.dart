import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_events.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_states.dart';
import 'package:loook/services/adverts_list_provider.dart';

class AdvertsListBloc extends Bloc<AdvertsListEvents, AdvertsListStates>{
  AdvertsListBloc(AdvertsListStates initialState) : super(initialState);

  @override
  Stream<AdvertsListStates> mapEventToState(AdvertsListEvents event) async*{
    if(event is FetchAdvertsListEvent) {
      AdvertsListProvider.fetchAdvertsList();
      yield AdvertsListFetchedState();
    }
  }
}