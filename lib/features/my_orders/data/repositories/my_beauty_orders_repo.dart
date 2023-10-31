import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/data/repositories/beauty_cart_repo.dart';
import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/beauty_order.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';

class MyBeautyOrdersRepo {
  Future<List<MyBeautyOrderModel>> beautyOrders() async {
    List<MyBeautyOrderModel> beautyOrders = [];
    final response = await BaseHttpClient().get(
      'beauty/beauty_orders/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final order in body) {
          try {
            final business = await BeautyRepo().getBusiness(
              order['order_business'],
            );
            final cart = await BeautyCartRepo().getCart(
              order['cart'],
            );
            beautyOrders.add(
              MyBeautyOrderModel(
                id: order['id'],
                products: cart!.products,
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
                place: business!,
              ),
            );
          } catch (e) {
            log('beautyOrder from map - ${order["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in beautyOrders: $e');
      }
    }
    return beautyOrders;
  }
}
