import 'package:loook/services/adverts_list_provider.dart';

class AdvertsListRepository{
  static get adverts => AdvertsListProvider.fetchAdvertsList();
}