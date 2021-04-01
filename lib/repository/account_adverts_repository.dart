import 'package:loook/services/adverts_list_provider.dart';

class AccountAdvertsRepository{
  static get accountAdverts => AdvertsListProvider.fetchAccountAdvertsList();
}