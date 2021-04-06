import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/repository/categories_details_repository.dart';
import 'package:loook/services/upload_advert_provider.dart';

class AdvertDetailsBloc extends Bloc<AdvertDetailsEvents, AdvertDetailsStates> {
  List<AdvertDetailsModel> categoriesList = [];
  Map<dynamic, dynamic> advertDetails = {};
  List<dynamic> imageList = [];
  int categoryIndex;
  int subCategoryIndex;
  int keyIndex = 0;
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
        if (event.categoryIndex != null) {
          categoryIndex = event.categoryIndex;
        } else {
          categoryIndex = categoryIndex;
          keyIndex = 0;
        }
        yield SubCategoriesListFetchedState(
            subCategoriesDetailsList: categoriesList[categoryIndex].children);
      } catch (_) {
        print('fetching subCategories exception $_');
      }
    }
    if (event is FetchCategoryDetailsEvent) {
      subCategoryIndex = event.subCategoryIndex;
      yield CategoryDetailsFetchedState(
        categoryDetailsMap:
            categoriesList[categoryIndex].children[subCategoryIndex].fields,
        key: categoriesList[categoryIndex]
            .children[subCategoryIndex]
            .fields
            .keys
            .elementAt(keyIndex),
        values: categoriesList[categoryIndex]
            .children[subCategoryIndex]
            .fields
            .values
            .elementAt(keyIndex),
        keyIndex: keyIndex,
      );
    }

    if (event is FetchNextCategoryDetailsEvent) {
      if (keyIndex <
          categoriesList[categoryIndex]
                  .children[subCategoryIndex]
                  .fields
                  .keys
                  .length -
              1) {
        keyIndex++;
        yield CategoryDetailsFetchedState(
            categoryDetailsMap:
                categoriesList[categoryIndex].children[subCategoryIndex].fields,
            key: categoriesList[categoryIndex]
                .children[subCategoryIndex]
                .fields
                .keys
                .elementAt(keyIndex),
            values: categoriesList[categoryIndex]
                .children[subCategoryIndex]
                .fields
                .values
                .elementAt(keyIndex),
            keyIndex: keyIndex);
      }
    }

    if (event is FetchPreviousCategoryDetailsEvent) {
      if (keyIndex != 0) {
        keyIndex--;
      }
      yield CategoryDetailsFetchedState(
        categoryDetailsMap:
            categoriesList[categoryIndex].children[subCategoryIndex].fields,
        key: categoriesList[categoryIndex]
            .children[subCategoryIndex]
            .fields
            .keys
            .elementAt(keyIndex),
        values: categoriesList[categoryIndex]
            .children[subCategoryIndex]
            .fields
            .values
            .elementAt(keyIndex),
        keyIndex: keyIndex,
      );
    }

    if (event is AddDetailEvent) {
      if (event.advertDetail.containsKey('fields')) {
        advertDetails.containsKey('fields')
            ? advertDetails['fields'].addAll(event.advertDetail['fields'])
            : advertDetails.addAll(event.advertDetail);
      } else {
        advertDetails.addAll(event.advertDetail);
      }
    }

    if (event is AddImageListEvent) {
      imageList = [...event.imageList];
    }

    if (event is ChangeCurrencyEvent) {
      yield CurrencyChangedState(currency: event.currency);
    }
    if (event is UploadAdvertEvent) {
      yield AdvertIsUploadingState();
      try {
       String advertUploadingResult = await UploadAdvertProvider.uploadAdvert(advertDetails, imageList);
       yield AdvertState(advertState: advertUploadingResult);
      } catch (_) {
        //TODO: error state
      }
    }

  }
}
