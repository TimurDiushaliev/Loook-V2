import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_states.dart';
import 'package:loook/repository/adverts_repository.dart';

class FavoriteAdvertsListBloc
    extends Bloc<FavoriteAdvertsListEvents, FavoriteAdvertsListStates> {
  FavoriteAdvertsListBloc(FavoriteAdvertsListStates initialState)
      : super(initialState);

  @override
  Stream<FavoriteAdvertsListStates> mapEventToState(event) async* {
    if (event is AdvertNotLikedEvent) yield AdvertNotLikedState();

    if (event is FetchFavoriteAdvertsListEvent) {
      try {
        List<dynamic> favoriteAdverts = await AdvertsRepository.favoriteAdverts;
        if (favoriteAdverts != null) {
          yield FavoriteAdvertsListFetchedState(
              favoriteAdverts: favoriteAdverts);
        } else {
          yield FavoriteAdvertsNotFetchedState();
        }
      } catch (_) {
        print('favorite list exception $_');
      }
    }
  }
}
