import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_states.dart';
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/repository/categories_details_repository.dart';

class FetchingCategoriesBloc extends Bloc<FetchingCategoriesEvents, FetchingCategoriesStates> {
  FetchingCategoriesBloc(FetchingCategoriesStates initialState) : super(initialState);

  @override
  Stream<FetchingCategoriesStates> mapEventToState(
      FetchingCategoriesEvents event) async* {
    if (event is FetchCategoriesListEvent) {
      try {
        List<AdvertDetailsModel> categoriesDetailsList =
            await CategoriesDetailsRepository.categoriesDetails;
        yield CategoriesListFetchedState(
            categoriesDetailsList: categoriesDetailsList);
      } catch (_) {
        print('fetching categoires exception $_');
      }
    }
    if (event is FetchSubCategoriesListEvent) {
      try {
        List<AdvertDetailsModel> categoriesDetailsList =
            await CategoriesDetailsRepository.categoriesDetails;
        yield SubCategoriesListFetchedState(
            subCategoriesDetailsList:
                categoriesDetailsList[event.index].children);
      } catch (_) {
        print('fetching subCategories exception $_');
      }
    }
  
  }
}
