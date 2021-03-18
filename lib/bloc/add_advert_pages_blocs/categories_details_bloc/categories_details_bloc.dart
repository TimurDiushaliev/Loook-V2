import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/categories_details_bloc/categories_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/categories_details_bloc/categories_details_states.dart';
import 'package:loook/models/categories_details_model.dart';
import 'package:loook/repository/categories_details_repository.dart';

class CategoriesDetailsBloc
    extends Bloc<CategoriesDetailsEvents, CategoriesDetailsStates> {
  CategoriesDetailsBloc(CategoriesDetailsStates initialState)
      : super(initialState);

  @override
  Stream<CategoriesDetailsStates> mapEventToState(
      CategoriesDetailsEvents event) async* {
    if (event is CategorieTappedEvent) {
      print('1');
      try {
        List<CategoriesDetailsModel> categoriesDetailsList =
            await CategoriesDetailsRepository.categoriesDetails;
        print('categories list $categoriesDetailsList');
        yield CategorieDetailsState(
            categoriesDetailsList: categoriesDetailsList);
      } catch (e) {
        print('object $e');
      }
    }
  }
}
