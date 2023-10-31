import 'package:malina_mobile_app/shared/models/product.dart';

abstract class AbstractProductOrderModel {
  final int id;
  final int amount;
  abstract final AbstractProduct product;
  AbstractProductOrderModel({
    required this.id,
    required this.amount,
  });
}
