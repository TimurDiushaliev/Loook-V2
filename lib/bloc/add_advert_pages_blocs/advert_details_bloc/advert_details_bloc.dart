import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/services/upload_advert_provider.dart';

class AdvertDetailsBloc extends Bloc<AdvertDetailsEvents, AdvertDetailsStates> {
  Map<dynamic, dynamic> advertDetails = {};
  AdvertDetailsBloc(AdvertDetailsStates initialState) : super(initialState);

  @override
  Stream<AdvertDetailsStates> mapEventToState(
      AdvertDetailsEvents event) async* {
    if (event is AddDetailEvent) {
      advertDetails.addAll(event.advertDetail);
      print(advertDetails);
    }

    if (event is ChangeCurrencyEvent) {
      yield CurrencyChangedState(currency: event.currency);
    }
    if(event is UploadAdvertEvent){
      UploadAdvertProvider.uploadAdvert(advertDetails);
    }
  }
}
