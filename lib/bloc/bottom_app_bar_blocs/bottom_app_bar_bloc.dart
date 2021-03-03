import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/bottom_app_bar_blocs/bottom_app_bar_events.dart';
import 'package:loook/bloc/bottom_app_bar_blocs/bottom_app_bar_states.dart';

class BottomAppBarBloc extends Bloc<BottomAppBarEvents, BottomAppBarStates> {
  final homePageState = HomePageState();
  BottomAppBarBloc(homePageState) : super(HomePageState());

  @override
  Stream<BottomAppBarStates> mapEventToState(BottomAppBarEvents event) async* {
    if (event is HomePageEvent) yield HomePageState();
    if (event is FavoritesPageEvent) yield FavoritesPageState();
    if (event is ChatPageEvent) yield ChatPageState();
    if (event is AccountPageEvent) yield AccountPageState();
  }
}
