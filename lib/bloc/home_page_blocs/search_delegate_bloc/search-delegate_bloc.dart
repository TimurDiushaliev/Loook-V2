import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search_delegate_events.dart';
import 'package:loook/bloc/home_page_blocs/search_delegate_bloc/search_delegate_states.dart';
import 'package:loook/services/adverts_provider.dart';

class SearchDelegateBloc
    extends Bloc<SearchDelegateEvents, SearchDelegateStates> {
  SearchDelegateBloc(SearchDelegateStates initialState) : super(initialState);

  @override
  Stream<SearchDelegateStates> mapEventToState(
      SearchDelegateEvents event) async* {
    if (event is FetchAdvertsViaQueryEvent) {
      try {
        List<dynamic> searchDelegateResultsList =
            await AdvertsProvider.fetchAdvertsBySearchDelegate(
                event.query, event.offset);
        print(searchDelegateResultsList);
        if (searchDelegateResultsList != null) {
          yield AdvertsViaSearchDelegateFetchedState(
              searchDelegateResultsList: searchDelegateResultsList);
        } else {
          yield AdvertsViaSearchDelegateTokenNotValidState();
        }
      } catch (_) {
        SearchDelegateFetchingErrorState();
      }
    }
  }
}
