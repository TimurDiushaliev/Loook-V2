import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvents, FavoriteListStates> {
  int index;
  FavoriteListBloc(FavoriteListStates initialState) : super(initialState);

  @override
  Stream<FavoriteListStates> mapEventToState(event) async* {
    if (event is AdvertLikedEvent) {
      print('${event.index}');
      index = event.index;
      yield AdvertLikedState(index: index);
    }
    if (event is AdvertNotLikedEvent) yield AdvertNotLikedState();
  }
}
