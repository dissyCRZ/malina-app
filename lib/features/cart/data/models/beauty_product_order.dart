import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';
import 'package:malina_mobile_app/features/cart/data/models/abstract_product.dart';

class BeautyProductOrderModel extends AbstractProductOrderModel {
  @override
  final BeautyProductModel product;

  BeautyProductOrderModel({
    required super.id,
    required super.amount,
    required this.product,
  });
  factory BeautyProductOrderModel.fromMap(
      Map<String, dynamic> map, [BeautyProductModel? product]) {
    return BeautyProductOrderModel(
      id: map['id'],
      amount: map['quantity'],
      product: product ??
          BeautyProductModel.fromMap(
            map['beauty_product'],
          ),
    );
  }
}
