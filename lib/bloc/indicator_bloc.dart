import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum IndicatorEvent {
  first_item_selected,
  second_item_selected,
  item_not_selected
}

class IndicatorBloc extends Bloc<IndicatorEvent, Color> {
  Color _indicatorColor = Colors.grey;
  IndicatorBloc(Color _indicatorColor) : super(Colors.grey);

  @override
  Stream<Color> mapEventToState(IndicatorEvent event) async* {
    _indicatorColor = (event == IndicatorEvent.first_item_selected)
        ? Colors.white
        : Colors.grey;
    yield _indicatorColor;
  }
}
