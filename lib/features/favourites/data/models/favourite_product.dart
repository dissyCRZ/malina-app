import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';
import '../../../food_shop/data/models/place.dart';

class FavouriteProductModel {
  final int id;
  final BusinessModel barbershop;
  final BeautyProductModel product;
  FavouriteProductModel({
    required this.id,
    required this.barbershop,
    required this.product,
  });
}
