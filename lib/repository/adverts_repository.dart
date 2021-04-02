import 'package:loook/services/adverts_provider.dart';

class AdvertsRepository{
  static get adverts => AdvertsProvider.fetchAdvertsList();
}