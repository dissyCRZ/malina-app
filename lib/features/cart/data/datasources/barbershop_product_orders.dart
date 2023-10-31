import 'package:malina_mobile_app/features/cart/data/models/beauty_product_order.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';
import 'beauty_products_list.dart';

List<BeautyProductOrderModel> generateBarbershopProductOrders(int count) {
  final List<BeautyProductOrderModel> productOrdersList = [];
  for (int i = 0; i < count; i++) {
    final productOrder = BeautyProductOrderModel(
      id: DateTime.now().millisecondsSinceEpoch,
      amount: random.nextInt(5) + 1,
      product: beautyProductsList[random.nextInt(
        beautyProductsList.length,
      )],
    );
    if (!productOrdersList.any(
      (element) => element.product.id == productOrder.product.id,
    )) {
      productOrdersList.add(
        productOrder,
      );
    }
  }
  return productOrdersList;
}
