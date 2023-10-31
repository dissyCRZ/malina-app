import 'package:malina_mobile_app/features/cart/data/models/beauty_product_order.dart';

double getBarbershopProductTotalPrice(List<BeautyProductOrderModel> orders) {
  double totalPrice = 0;
  for (var food in orders) {
    totalPrice += food.amount * food.product.price;
  }
  return totalPrice;
}
