import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_product_order.dart';
import 'package:malina_mobile_app/features/cart/data/repositories/beauty_cart_repo.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';

part 'beauty_cart_state.dart';

class BeautyCartCubit extends Cubit<BeautyCartState> {
  BeautyCartCubit()
      : super(
          const BeautyCartState(
            [],
          ),
        );
  load() async {
    final orders = await BeautyCartRepo().cartList();
    emit(
      BeautyCartState(
        orders,
      ),
    );
  }

  empty() {
    emit(
      const BeautyCartState(
        [],
      ),
    );
  }

  addOrder(BeautyProductModel product, int amount,
      {BusinessModel? place}) async {
    final allOrders = [
      ...super.state.beautyOrders,
    ];
    final business =
        place ?? await BeautyRepo().getBusiness(product.supplierId);
    if (business == null) return;
    //If This business have another order
    if (allOrders.any(
      (element) => element.business.id == business.id,
    )) {
      final orderIndex = allOrders.indexWhere(
        (element) => element.business.id == business.id,
      );
      //If Order already Exists
      if (allOrders[orderIndex].products.any(
            (element) => element.product.id == product.id,
          )) {
        final foodIndex = allOrders[orderIndex]
            .products
            .indexWhere((element) => element.product.id == product.id);
        final orderedProduct = await BeautyCartRepo().addOrderedProduct(
          product.id,
          amount,
        );
        if (orderedProduct == null) return;

        List<BeautyProductOrderModel> productOrders = [
          ...allOrders[orderIndex].products,
        ];
        productOrders.removeAt(foodIndex);
        productOrders.insert(foodIndex, orderedProduct);
        final newOrder = await BeautyCartRepo().addCart(
          business,
          [
            orderedProduct,
          ],
        );
        if (newOrder != null) {
          allOrders.removeAt(orderIndex);
          allOrders.insert(orderIndex, newOrder);
        }
      }
      //If Order doesn't Exist
      else {
        final orderedProduct = await BeautyCartRepo().addOrderedProduct(
          product.id,
          amount,
        );
        if (orderedProduct == null) return;
        final order = await BeautyCartRepo().addCart(
          business,
          [
            orderedProduct,
          ],
        );
        if (order == null) return;
        allOrders.removeAt(orderIndex);
        allOrders.insert(orderIndex, order);
      }
    }
    //If This business doesn't have another order
    else {
      final orderedProduct = await BeautyCartRepo().addOrderedProduct(
        product.id,
        amount,
      );
      if (orderedProduct != null) {
        final newOrder = await BeautyCartRepo().addCart(
          business,
          [orderedProduct],
        );
        if (newOrder != null) {
          allOrders.add(newOrder);
        }
      }
    }
    emit(
      BeautyCartState(allOrders),
    );
  }

  removeOrder(
    BeautyOrderModel order,
  ) {
    final allOrders = [
      ...super.state.beautyOrders,
    ];
    BeautyCartRepo().removeOrder(order);
    allOrders.removeWhere((element) => element.id == order.id);
    order.products.map(
      (e) => BeautyCartRepo().addOrderedProduct(e.product.id, 0),
    );
    emit(
      BeautyCartState(
        allOrders,
      ),
    );
  }

  increaseDecrease(
    BeautyOrderModel restaurant,
    BeautyProductOrderModel productOrder,
    bool isIncrease,
  ) {
    final newFood = BeautyProductOrderModel(
      id: productOrder.id,
      product: productOrder.product,
      amount: isIncrease ? productOrder.amount + 1 : productOrder.amount - 1,
    );
    final BeautyOrderModel newRestaurant = BeautyOrderModel(
      id: restaurant.id,
      business: restaurant.business,
      products: restaurant.products.map((e) {
        if (e.product.id == productOrder.product.id) {
          return newFood;
        }
        return e;
      }).toList(),
      type: restaurant.type,
    );
    final newOrders = super.state.beautyOrders.map((e) {
      if (e.id == restaurant.id) {
        return newRestaurant;
      }
      return e;
    }).toList();
    emit(
      BeautyCartState(newOrders),
    );
  }
}
