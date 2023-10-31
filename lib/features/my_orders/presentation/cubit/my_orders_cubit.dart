import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/order.dart';
import 'package:malina_mobile_app/features/my_orders/data/repositories/my_beauty_orders_repo.dart';
import 'package:malina_mobile_app/features/my_orders/data/repositories/my_orders_repo.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit()
      : super(
          const MyOrdersState(
            [],
            [],
          ),
        );
  load() async {
    final myBeautyOrdersList = await MyBeautyOrdersRepo().beautyOrders();
    final myOrdersList = await MyOrdersRepo().foodOrders();
    emit(
      MyOrdersState(
        myOrdersList,
        myBeautyOrdersList,
      ),
    );
  }

  empty() {
    emit(
      const MyOrdersState(
        [],
        [],
      ),
    );
  }

  addOrder(RestaurantOrderModel order, AddressModel address) {
    List<MyOrderModel> orders = [
      ...super.state.orders,
    ];
    orders.add(
      MyOrderModel(
        id: order.id,
        date: DateTime.now(),
        status: OrderStatusEnum.values.elementAt(
          Random().nextInt(
            OrderStatusEnum.values.length,
          ),
        ),
        place: order.restaurant,
        products: order.foods,
        type: order.type,
        address: address,
      ),
    );
    emit(
      MyOrdersState(
        orders,
        super.state.beautyOrders,
      ),
    );
  }

  addBeautyOrder(RestaurantOrderModel order, AddressModel address) {
    List<MyOrderModel> orders = [
      ...super.state.orders,
    ];
    orders.add(
      MyOrderModel(
        id: order.id,
        date: DateTime.now(),
        status: OrderStatusEnum.values.elementAt(
          Random().nextInt(
            OrderStatusEnum.values.length,
          ),
        ),
        place: order.restaurant,
        products: order.foods,
        type: order.type,
        address: address,
      ),
    );
    emit(
      MyOrdersState(
        orders,
        super.state.beautyOrders,
      ),
    );
  }
}
