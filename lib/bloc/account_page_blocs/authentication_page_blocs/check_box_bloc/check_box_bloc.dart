import 'package:flutter_bloc/flutter_bloc.dart';

enum CheckBoxEvents { not_checked, checked }

class CheckBoxBloc extends Bloc<CheckBoxEvents, bool> {
  CheckBoxBloc(bool initialState) : super(initialState);

  @override
  Stream<bool> mapEventToState(CheckBoxEvents event) async* {
    switch (event) {
      case CheckBoxEvents.not_checked:
        yield false;
        break;
      case CheckBoxEvents.checked:
        yield true;
        break;
    }
  }
}
