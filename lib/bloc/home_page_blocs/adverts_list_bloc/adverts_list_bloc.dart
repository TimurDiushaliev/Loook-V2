import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_events.dart';
import 'package:loook/bloc/home_page_blocs/adverts_list_bloc/adverts_list_states.dart';
import 'package:loook/models/adverts_list_model.dart';
import 'package:loook/repository/adverts_list_repository.dart';

class AdvertsListBloc extends Bloc<AdvertsListEvents, AdvertsListStates> {
  AdvertsListBloc(AdvertsListStates initialState) : super(initialState);

  @override
  Stream<AdvertsListStates> mapEventToState(AdvertsListEvents event) async* {
    if (event is FetchAdvertsListEvent) {
      List<AdvertsListModel> adverts = await AdvertsListRepository.adverts;
      print('${adverts[0].price}');
      print('${adverts[0].currency}');
      print('${adverts[0].title}');
      yield AdvertsListFetchedState(adverts: adverts);
    }
  }
}
