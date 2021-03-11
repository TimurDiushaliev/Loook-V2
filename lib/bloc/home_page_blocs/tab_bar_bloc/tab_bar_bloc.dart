import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/tab_bar_bloc/tab_bar_events.dart';
import 'package:loook/bloc/home_page_blocs/tab_bar_bloc/tab_bar_states.dart';


class CategoriesTabBarBloc extends Bloc<CategoriesTabBarEvents, CategoriesTabBarStates> {
  CategoriesTabBarBloc(CategoriesTabBarStates initialState) : super(initialState);

  @override
  Stream<CategoriesTabBarStates> mapEventToState(CategoriesTabBarEvents event) async* {
    if(event is HideTabBarEvent) yield HideTabBarState();
    if(event is ShowTabBarEvent) yield ShowTabBarState();
  }
}
