import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/data/models/extra.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import '../../../food_shop/data/models/place.dart';
import '../../data/repositories/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState([]));
  load() async {
    final orders = await CartRepo().cartList();
    emit(
      CartState(
        orders,
      ),
    );
  }

  empty() {
    emit(
      const CartState(
        [],
      ),
    );
  }

  addOrder(BusinessModel restaurant, FoodModel food, int amount) {
    final allOrders = [
      ...super.state.foodOrders,
    ];
    if (allOrders.any(
      (element) => element.restaurant.id == restaurant.id,
    )) {
      final orderIndex = allOrders.indexWhere(
        (element) => element.restaurant.id == restaurant.id,
      );
      if (allOrders[orderIndex]
          .foods
          .any((element) => element.product.id == food.id)) {
        final foodIndex = allOrders[orderIndex]
            .foods
            .indexWhere((element) => element.product.id == food.id);
        final newFood = FoodOrderModel(
          id: DateTime.now().millisecondsSinceEpoch,
          amount: amount + allOrders[orderIndex].foods[foodIndex].amount,
          product: food,
        );
        List<FoodOrderModel> foodOrders = [
          ...allOrders[orderIndex].foods,
        ];
        foodOrders.removeAt(foodIndex);
        foodOrders.insert(foodIndex, newFood);
        final order = RestaurantOrderModel(
          id: DateTime.now().millisecondsSinceEpoch,
          restaurant: restaurant,
          foods: foodOrders,
          type: DeliveryTypeEnum.delivery,
        );
        allOrders.removeAt(orderIndex);
        allOrders.insert(orderIndex, order);
      } else {
        final order = RestaurantOrderModel(
          id: DateTime.now().millisecondsSinceEpoch,
          restaurant: restaurant,
          foods: [
            ...allOrders[orderIndex].foods,
            FoodOrderModel(
              id: DateTime.now().millisecondsSinceEpoch,
              amount: amount,
              product: food,
            ),
          ],
          type: DeliveryTypeEnum.delivery,
        );
        allOrders.removeAt(orderIndex);
        allOrders.insert(orderIndex, order);
      }
    } else {
      final newOrder = RestaurantOrderModel(
        id: DateTime.now().millisecondsSinceEpoch,
        restaurant: restaurant,
        foods: [
          FoodOrderModel(
            id: DateTime.now().millisecondsSinceEpoch,
            amount: amount,
            product: food,
          ),
        ],
        type: DeliveryTypeEnum.outside,
      );
      allOrders.add(newOrder);
    }
    emit(
      CartState(allOrders),
    );
  }

  removeOrder(
    RestaurantOrderModel restaurant,
  ) {
    final allOrders = [
      ...super.state.foodOrders,
    ];
    allOrders.removeWhere((element) => element.id == restaurant.id);
    emit(
      CartState(
        allOrders,
      ),
    );
  }

  increaseDecrease(
    RestaurantOrderModel restaurant,
    FoodOrderModel food,
    bool isIncrease,
  ) {
    final newFood = FoodOrderModel(
      id: food.id,
      product: food.product,
      amount: isIncrease ? food.amount + 1 : food.amount - 1,
    );
    final RestaurantOrderModel newRestaurant = RestaurantOrderModel(
      id: restaurant.id,
      restaurant: restaurant.restaurant,
      foods: restaurant.foods.map((e) {
        if (e.product.id == food.product.id) {
          return newFood;
        }
        return e;
      }).toList(),
      type: restaurant.type,
    );
    final newOrders = super.state.foodOrders.map((e) {
      if (e.id == restaurant.id) {
        return newRestaurant;
      }
      return e;
    }).toList();
    emit(
      CartState(newOrders),
    );
  }

  addExtra(RestaurantOrderModel restaurant, FoodOrderModel food,
      List<ExtraModel> extras) {
    final newFood = FoodOrderModel(
      id: food.id,
      product: food.product,
      amount: food.amount,
      extras: extras,
    );
    final RestaurantOrderModel newRestaurant = RestaurantOrderModel(
      id: restaurant.id,
      restaurant: restaurant.restaurant,
      foods: restaurant.foods.map((e) {
        if (e.product.id == food.product.id) {
          return newFood;
        }
        return e;
      }).toList(),
      type: restaurant.type,
    );
    final newOrders = super.state.foodOrders.map((e) {
      if (e.id == restaurant.id) {
        return newRestaurant;
      }
      return e;
    }).toList();
    emit(
      CartState(newOrders),
    );
  }
}
