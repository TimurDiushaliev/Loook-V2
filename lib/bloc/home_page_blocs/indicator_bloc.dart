import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/indicator_events.dart';
import 'package:loook/bloc/home_page_blocs/indicator_states.dart';

class IndicatorBloc extends Bloc<IndicatorEvents, IndicatorStates> {
  FirstItemSelectedState firstItemState = FirstItemSelectedState();
  IndicatorBloc(IndicatorStates initialState) : super(initialState);

  @override
  Stream<IndicatorStates> mapEventToState(IndicatorEvents event) async* {
    if (event is FirstItemSelectedEvent) yield FirstItemSelectedState();
    if (event is SecondItemSelectedEvent) yield SecondItemSelectedState();
  }
}
