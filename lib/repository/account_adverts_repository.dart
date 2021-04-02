import 'package:loook/services/adverts_provider.dart';

class AccountAdvertsRepository{
  static get accountAdverts => AdvertsProvider.fetchAccountAdvertsList();
}