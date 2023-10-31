import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_product_order.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';

class BeautyCartRepo {
  Future<BeautyOrderModel?> getCart(int id) async {
    final response = await BaseHttpClient().get(
      'beauty/beauty_carts/$id/',
    );
    if (response != null) {
      try {
        final order = jsonDecode(response);
        final business = await BeautyRepo().getBusiness(
          order['cart_business'],
        );
        final beautyProductOrder = (order['products_list'] as List)
            .map(
              (e) => BeautyProductOrderModel.fromMap(e),
            )
            .toList();
        return BeautyOrderModel(
          id: order['id'],
          products: beautyProductOrder,
          type: DeliveryTypeEnum.delivery,
          business: business!,
        );
      } catch (e) {
        log('Someting wrong in cartList: $e');
      }
    }
    return null;
  }

  Future<List<BeautyOrderModel>> cartList() async {
    List<BeautyOrderModel> beautyOrders = [];
    final response = await BaseHttpClient().get(
      'beauty/beauty_carts/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final order in body) {
          try {
            final business = await BeautyRepo().getBusiness(
              order['cart_business'],
            );
            final beautyProductOrder = (order['products_list'] as List)
                .map(
                  (e) => BeautyProductOrderModel.fromMap(e),
                )
                .toList();
            beautyOrders.add(
              BeautyOrderModel(
                id: order['id'],
                products: beautyProductOrder,
                type: DeliveryTypeEnum.delivery,
                business: business!,
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

  Future<BeautyProductOrderModel?> addOrderedProduct(
      int beautyProduct, int amount) async {
    try {
      final response = await BaseHttpClient().post(
        'beauty/beauty_ordered_products/',
        {
          "beauty_product": beautyProduct,
          "quantity": amount,
        },
      );
      if (response != null) {
        log(
          response.toString(),
        );
        final body = jsonDecode(
          response,
        );
        final beautyProduct = await BeautyRepo().getProduct(
          body['beauty_product'],
        );
        return BeautyProductOrderModel.fromMap(
          body,
          beautyProduct,
        );
      }
    } catch (e) {
      log('Someting wrong in addOrderedProduct: $e');
    }
    return null;
  }

  Future<BeautyOrderModel?> addCart(BusinessModel business,
      List<BeautyProductOrderModel> orderedProducts) async {
    final response = await BaseHttpClient().post('beauty/beauty_carts/', {
      "products_list": orderedProducts.map((e) => e.id).toList(),
      "cart_business": business.id,
    });
    if (response != null) {
      log(
        response.toString(),
      );
      try {
        final body = jsonDecode(response);
        final beautyProductOrder = (body['products_list'] as List)
            .map(
              (e) => BeautyProductOrderModel.fromMap(e),
            )
            .toList();
        BeautyOrderModel(
          id: body['id'],
          business: business,
          products: beautyProductOrder,
          type: DeliveryTypeEnum.delivery,
        );
      } catch (e) {
        log('Someting wrong in cartList: $e');
      }
    }
    return null;
  }

  Future<BeautyOrderModel?> removeOrder(BeautyOrderModel order) async {
    final response = await BaseHttpClient().delete(
      'beauty/beauty_carts/${order.id}',
    );
    if (response != null) {
      log(
        response.toString(),
      );
    }
    return null;
  }
}
