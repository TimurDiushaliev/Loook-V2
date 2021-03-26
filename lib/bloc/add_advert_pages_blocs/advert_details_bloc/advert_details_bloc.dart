import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/repository/categories_details_repository.dart';
import 'package:loook/services/upload_advert_provider.dart';

class AdvertDetailsBloc extends Bloc<AdvertDetailsEvents, AdvertDetailsStates> {
  List<AdvertDetailsModel> categoriesList = [];
  Map<dynamic, dynamic> advertDetails = {};
  int categoryIndex;
  int subCategoryIndex;
  int keyIndex = 3;
  AdvertDetailsBloc(AdvertDetailsStates initialState) : super(initialState);

  @override
  Stream<AdvertDetailsStates> mapEventToState(
      AdvertDetailsEvents event) async* {
    if (event is FetchCategoriesListEvent) {
      try {
        categoriesList = await CategoriesDetailsRepository.categoriesDetails;
        yield CategoriesListFetchedState(categoriesDetailsList: categoriesList);
      } catch (_) {
        print('fetching categoires exception $_');
      }
    }
    if (event is FetchSubCategoriesListEvent) {
      try {
        categoryIndex = event.index != null ? event.index : categoryIndex;
        print(categoryIndex);
        yield SubCategoriesListFetchedState(
            subCategoriesDetailsList: categoriesList[categoryIndex].children);
      } catch (_) {
        print('fetching subCategories exception $_');
      }
    }
    if (event is FetchCategoryDetailsEvent) {
      print('category index $categoryIndex');
      subCategoryIndex = event.index;
      print(categoriesList[categoryIndex].children[subCategoryIndex].fields);
      yield CategoryDetailsFetchedState(
          categoryDetailsMap:
              categoriesList[categoryIndex].children[subCategoryIndex].fields,
          key: categoriesList[categoryIndex]
              .children[subCategoryIndex]
              .fields
              .keys.elementAt(keyIndex),
          values: categoriesList[categoryIndex]
              .children[subCategoryIndex]
              .fields
              .values
              .elementAt(keyIndex));
    }
    if (event is AddDetailEvent) {
      advertDetails.addAll(event.advertDetail);
      print(advertDetails);
    }

    if (event is ChangeCurrencyEvent) {
      yield CurrencyChangedState(currency: event.currency);
    }
    if (event is UploadAdvertEvent) {
      UploadAdvertProvider.uploadAdvert(advertDetails);
    }
  }
}
