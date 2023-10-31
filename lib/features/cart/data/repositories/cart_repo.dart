import 'dart:convert';
import 'dart:developer';

import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/food_shop/data/repositories/food_repo.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';

import '../enums/order_type.dart';

class CartRepo{
   Future<List<RestaurantOrderModel>> cartList() async {
    List<RestaurantOrderModel> beautyOrders = [];
    final response = await BaseHttpClient().get(
      'products/cart/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final order in body) {
          try {
            final business = await FoodShopRepo().getBusiness(
              order['cart_business'],
            );
            final beautyProductOrder = (order['products_list'] as List)
                .map(
                  (e) => FoodOrderModel.fromMap(e),
                )
                .toList();
            beautyOrders.add(
              RestaurantOrderModel(
                id: order['id'],
                foods: beautyProductOrder,
                type: DeliveryTypeEnum.delivery,
                restaurant: business!,
              ),
            );
          } catch (e) {
            log('BeautyOrder from map - ${order["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in cartList: $e');
      }
    }
    return beautyOrders;
  }

  Future<int?> addOrderedProduct(int beautyProduct, int amount) async {
    try {
      final response = await BaseHttpClient().post(
        'beauty/beauty_ordered_products/',
        {
          {"beauty_product": beautyProduct, "quantity": amount}
        },
      );
      if (response != null) {
        return jsonDecode(response)['id'] as int;
      }
    } catch (e) {
      log('Someting wrong in addOrderedProduct: $e');
    }
    return null;
  }

  Future<RestaurantOrderModel?> addCart(BusinessModel business,
      List<RestaurantOrderModel> products, List<int> amounts) async {
    List<int> orderedProducts = [];
    for (int i = 0; i < products.length;i++) {
       final orderedProduct = await addOrderedProduct(
          products[i].id,
          amounts[i],
        );
        if (orderedProduct != null) {
          orderedProducts.add(orderedProduct);
        }
    }
    final response = await BaseHttpClient().post('beauty/beauty_carts/', {
      {
        "products_list": orderedProducts,
        "cart_business": business.id,
      }
    });
    if (response != null) {
      try {
        final body = jsonDecode(response);
        final beautyProductOrder = (body['products_list'] as List)
            .map(
              (e) => FoodOrderModel.fromMap(e),
            )
            .toList();
        RestaurantOrderModel(
          id: body['id'],
          restaurant: business,
          foods: beautyProductOrder,
          type: DeliveryTypeEnum.delivery,
        );
      } catch (e) {
        log('Someting wrong in cartList: $e');
      }
    }
    return null;
  }
}