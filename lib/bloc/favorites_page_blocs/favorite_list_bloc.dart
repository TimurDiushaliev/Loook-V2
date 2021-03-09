import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_list_states.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvents, FavoriteListStates>{
  FavoriteListBloc(FavoriteListStates initialState) : super(initialState);

  @override
  Stream<FavoriteListStates> mapEventToState(event) async*{
    if(event is AdvertLikedEvent) yield AdvertLikedState(); 
    if(event is AdvertNotLikedEvent) yield AdvertNotLikedState();
  }

}