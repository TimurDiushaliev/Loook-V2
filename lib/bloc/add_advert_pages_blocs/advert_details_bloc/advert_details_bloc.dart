import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/models/advert_details_model.dart';
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/repository/categories_details_repository.dart';

class AdvertDetailsBloc extends Bloc<AdvertDetailsEvents, AdvertDetailsStates> {
  Map<dynamic, dynamic> advertDetails = {};
  AdvertDetailsBloc(AdvertDetailsStates initialState) : super(initialState);

  @override
  Stream<AdvertDetailsStates> mapEventToState(
      AdvertDetailsEvents event) async* {
    if (event is FetchCategoryDetailsEvent) {
      try {
        List<AdvertDetailsModel> categoriesDetailsList =
            await CategoriesDetailsRepository.categoriesDetails;
        print('categories list $categoriesDetailsList');
        print('children: ${categoriesDetailsList[0].children[0].name}');
        yield CategoriesListFetchedState(
            categoriesDetailsList: categoriesDetailsList);
      } catch (_) {
        print('object $_');
      }
    }
    if (event is FetchSubCategoriesListEvent) {
      try {
        List<AdvertDetailsModel> categoriesDetailsList =
            await CategoriesDetailsRepository.categoriesDetails;
        yield SubCategoriesListFetchedState(
            categoriesDetailsList: categoriesDetailsList);
      } catch (_) {
        print('object $_');
      }
    }
    if (event is NavigateToAddMediaPageEvent) yield AddMediaPageState();
    if (event is NavigateToAddDescriptionEvent) yield AddDescriptionPageState();
    if (event is NavigateToAddPricePageEvent) yield AddPricePageState();
    if (event is AddDetailEvent) {
      advertDetails.addAll(event.advertDetail);
      print('$advertDetails');
    }
  }
}
