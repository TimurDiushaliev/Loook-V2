import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/nav_bar/nav_bar_events.dart';
import 'package:loook/bloc/nav_bar/nav_bar_states.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  final adsPage = AdsPageState();
  NavBarBloc(adsPage) : super(AdsPageState());

  @override
  Stream<NavBarState> mapEventToState(NavBarEvent event) async* {
    if (event is AdsPageEvent) {
      yield AdsPageState();
    }
    if (event is FavoritesPageEvent) {
      yield FavoritesPageState();
    }
    if (event is ChatPageEvent) {
      yield ChatPageState();
    }
    if (event is ProfilePageEvent) {
      yield ProfilePageState();
    }
  }
}
