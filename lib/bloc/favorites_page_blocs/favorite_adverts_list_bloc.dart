import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_events.dart';
import 'package:loook/bloc/favorites_page_blocs/favorite_adverts_list_states.dart';
import 'package:loook/repository/adverts_repository.dart';
import 'package:loook/services/favorites_adverts_provider.dart';

class FavoriteAdvertsListBloc
    extends Bloc<FavoriteAdvertsListEvents, FavoriteAdvertsListStates> {
  int index;
  FavoriteAdvertsListBloc(FavoriteAdvertsListStates initialState)
      : super(initialState);

  @override
  Stream<FavoriteAdvertsListStates> mapEventToState(event) async* {
    if (event is AdvertLikedEvent) {
      index = event.index;
      FavoriteAdvetsProvider.addAdvertToFavoritesList(event.id);
      yield AdvertLikedState(index: index);
    }
    if (event is AdvertNotLikedEvent) yield AdvertNotLikedState();

    if (event is FetchFavoriteAdvertsListEvent) {
      try {
        List<dynamic> favoriteAdverts = await AdvertsRepository.favoriteAdverts;
        yield FavoriteAdvertsListFetchedState(favoriteAdverts: favoriteAdverts);
      } catch (_) {
        print('favorite list exception $_');
      }
    }
  }
}
