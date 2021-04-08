import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_events.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_states.dart';
import 'package:loook/models/adverts_model.dart';
import 'package:loook/services/adverts_provider.dart';

class AdvertByIdBloc extends Bloc<FetchAdvertByIdEvent, AdvertByIdStates> {
  AdvertByIdBloc(AdvertByIdStates initialState) : super(initialState);

  @override
  Stream<AdvertByIdStates> mapEventToState(FetchAdvertByIdEvent event) async* {
    try {
      AdvertsModel advertById = await AdvertsProvider.fetchAdvertById(event.id);
      print(advertById);
      if (advertById != null) {
        yield AdvertByIdFetchedState(advertById: advertById);
      } else {
        yield AdvertByIdTokenNoValidState();
      }
    } catch (_) {
      AdvertByIdFetchingErrorState();
    }
  }
}
