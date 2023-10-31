import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_product_order.dart';
import '../../../food_shop/data/models/place.dart';

class BeautyOrderModel {
  final int id;
  final BusinessModel business;
  final List<BeautyProductOrderModel> products;
  final DeliveryTypeEnum type;
  BeautyOrderModel({
    required this.id,
    required this.business,
    required this.products,
    required this.type,
  });
}
