import 'package:malina_mobile_app/features/cart/data/models/abstract_product.dart';

double getOrderTotalPrice(List<AbstractProductOrderModel> foods) {
  double totalPrice = 0;
  for (var food in foods) {
    totalPrice += food.amount * food.product.price;
  }
  return totalPrice;
}
