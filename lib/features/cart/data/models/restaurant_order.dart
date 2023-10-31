import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import '../../../food_shop/data/models/place.dart';

class RestaurantOrderModel {
  final int id;
  final BusinessModel restaurant;
  final List<FoodOrderModel> foods;
  final DeliveryTypeEnum type;
  RestaurantOrderModel({
    required this.id,
    required this.restaurant,
    required this.foods,
    required this.type,
  });
}
