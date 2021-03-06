import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/bottom_sheet_bloc/bottom_sheet_states.dart';

import 'bottom_sheet_events.dart';



class BottomSheetBloc extends Bloc<BottomSheetEvents, BottomSheetStates>{
  BottomSheetBloc(BottomSheetStates initialState) : super(initialState);

  @override
  Stream<BottomSheetStates> mapEventToState(BottomSheetEvents event) async*{
    if(event is WithRoundedCornersEvent) yield WithRoundedCornersState();
    if(event is WithUsualCornersEvent) yield WithUsualCornersState();
  }
}