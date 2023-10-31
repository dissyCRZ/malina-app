import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/order.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';

class MyOrdersRepo {
  Future<List<MyOrderModel>> foodOrders() async {
    List<MyOrderModel> beautyOrders = [];
    final response = await BaseHttpClient().get(
      'products/user-order/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final order in body) {
          try {
            final business = BusinessModel.fromMap(
              order['business_id'],
            );
            List<FoodOrderModel> foodOrders = [];
            for (final foodProductList in (order['order_cart'])) {
              for (var product in (foodProductList['products_list'] as List)) {
                foodOrders.add(FoodOrderModel(
                  id: product['id'],
                  amount: product['quantity'],
                  product: FoodModel.fromMap(
                    product['product'],
                  ),
                ));
              }
            }
            beautyOrders.add(
              MyOrderModel(
                id: order['id'],
                products: foodOrders,
                type: DeliveryTypeEnum.values.elementAt(
                  order['order_type'],
                ),
                address: AddressModel.fromMap(
                  order['delivery_address'],
                ),
                date: DateTime.parse(
                  order['order_date'],
                ),
                status: OrderStatusEnum.values.elementAt(
                  order['status'],
                ),
                place: business,
              ),
            );
          } catch (e) {
            log('foodOrder from map - ${order["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in foodOrders: $e');
      }
    }
    return beautyOrders;
  }
}
