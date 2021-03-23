import 'package:loook/models/advert_details_model.dart';
import 'package:loook/services/categories_details_provider.dart';

class CategoriesDetailsRepository{
  static get categoriesDetails =>  CategoriesDetailsProvider.getCategoriesDetails();
}