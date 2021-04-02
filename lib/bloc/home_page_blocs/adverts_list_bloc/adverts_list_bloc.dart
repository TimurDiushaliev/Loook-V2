import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/models/adverts_list_model.dart';
import 'package:loook/repository/adverts_repository.dart';

import 'adverts_list_events.dart';
import 'adverts_list_states.dart';

class AdvertsListBloc extends Bloc<AdvertsListEvents, AdvertsListStates> {
  AdvertsListBloc(AdvertsListStates initialState) : super(initialState);

  @override
  Stream<AdvertsListStates> mapEventToState(AdvertsListEvents event) async* {
    if (event is FetchAdvertsListEvent) {
      List<AdvertsModel> adverts = await AdvertsRepository.adverts;
      yield AdvertsListFetchedState(adverts: adverts);
    }
  }
}
