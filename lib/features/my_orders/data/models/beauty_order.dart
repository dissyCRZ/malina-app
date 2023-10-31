import 'package:malina_mobile_app/features/cart/data/models/beauty_product_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/abstract_order.dart';

class MyBeautyOrderModel extends AbstractOrderModel {
  @override
  final List<BeautyProductOrderModel> products;

  MyBeautyOrderModel({
    required super.id,
    required super.status,
    required super.place,
    required super.type,
    required super.address,
    required super.date,
    required this.products,
  });
}
