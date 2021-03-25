import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_states.dart';
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/repository/categories_details_repository.dart';

class FetchingCategoriesBloc
    extends Bloc<FetchingCategoriesEvents, FetchingCategoriesStates> {
  int categoryIndex;
  int subCategoryIndex;
  FetchingCategoriesBloc(FetchingCategoriesStates initialState)
      : super(initialState);

  @override
  Stream<FetchingCategoriesStates> mapEventToState(
      FetchingCategoriesEvents event) async* {
    if (event is FetchCategoriesListEvent) {
      try {
        List<AdvertDetailsModel> categoriesList =
            await CategoriesDetailsRepository.categoriesDetails;
        yield CategoriesListFetchedState(categoriesDetailsList: categoriesList);
      } catch (_) {
        print('fetching categoires exception $_');
      }
    }
    if (event is FetchSubCategoriesListEvent) {
      try {
        categoryIndex = event.index;
        List<AdvertDetailsModel> categoriesList =
            await CategoriesDetailsRepository.categoriesDetails;
        yield SubCategoriesListFetchedState(
            subCategoriesDetailsList: categoriesList[categoryIndex].children);
      } catch (_) {
        print('fetching subCategories exception $_');
      }
    }
    if (event is FetchingCategoriesDetailsEvent) {
      try {
        subCategoryIndex = event.index;
        List<AdvertDetailsModel> categoriesList =
            await CategoriesDetailsRepository.categoriesDetails;
        print('category index $categoryIndex');
        print('subCategory index $subCategoryIndex');
        yield CategoryDetailsFetchedState(
            categoryDetailsMap: categoriesList[categoryIndex]
                .children[subCategoryIndex]
                .fields);
      } catch (_) {
        print('fetching categories details exception $_');
      }
    }
  }
}
