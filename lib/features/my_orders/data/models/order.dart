import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/abstract_order.dart';

class MyOrderModel extends AbstractOrderModel {
  @override
  final List<FoodOrderModel> products;

  MyOrderModel({
    required super.id,
    required super.status,
    required super.place,
    required super.type,
    required super.address,
    required super.date,
    required this.products,
  });
}
