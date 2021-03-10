import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/tab_bar_bloc/tab_bar_events.dart';
import 'package:loook/bloc/tab_bar_bloc/tab_bar_states.dart';

class TabBarBloc extends Bloc<TabBarEvents, TabBarStates> {
  TabBarBloc(TabBarStates initialState) : super(initialState);

  @override
  Stream<TabBarStates> mapEventToState(TabBarEvents event) async* {
    if (event is SubCategoriesTabBarEvent) yield SubCategoriesTabBarState();
  }
}
