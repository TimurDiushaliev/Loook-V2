import 'package:loook/services/adverts_provider.dart';
import 'package:loook/services/favorites_adverts_provider.dart';

class AdvertsRepository{
  static get adverts => AdvertsProvider.fetchAdvertsList();
  static get accountAdverts => AdvertsProvider.fetchAccountAdvertsList();
  static get favoriteAdverts => FavoriteAdvetsProvider.fetchFavoriteAdvertsList();
}