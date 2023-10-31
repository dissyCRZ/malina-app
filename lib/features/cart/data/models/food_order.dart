import 'package:malina_mobile_app/features/cart/data/models/abstract_product.dart';
import 'package:malina_mobile_app/features/cart/data/models/extra.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';

class FoodOrderModel extends AbstractProductOrderModel {
  @override
  final FoodModel product;
  final List<ExtraModel>? extras;

  FoodOrderModel({
    required super.id,
    required super.amount,
    required this.product,
    this.extras,
  });
  factory FoodOrderModel.fromMap(Map<String, dynamic> map) {
    return FoodOrderModel(
      id: map['id'],
      amount: map['quantity'],
      product: FoodModel.fromMap(
        map['beauty_product'],
      ),
    );
  }
}
