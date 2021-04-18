import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_details_bottom_sheet_bloc/advert_details_bottom_sheet_events.dart';
import 'package:loook/bloc/home_page_blocs/advert_details_blocs/advert_details_bottom_sheet_bloc/advert_details_bottom_sheet_states.dart';

class AdvertDetailsBottomSheetBloc extends Bloc<AdvertDetailsBottomSheetEvents,
    AdvertDetailsBottomSheetStates> {
  AdvertDetailsBottomSheetBloc(AdvertDetailsBottomSheetStates initialState)
      : super(initialState);

  @override
  Stream<AdvertDetailsBottomSheetStates> mapEventToState(
      AdvertDetailsBottomSheetEvents event) async* {
    if (event is AdvertDetailsWithRoundedCornersEvent)
      yield AdvertDetailsWithRoundedCornersState();
    if (event is AdvertDetailsWithUsualCornersEvent)
      yield AdvertDetailsWithUsualCornersState();
  }
}
