import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/my_orders_cubit.dart';
import '../../presentation/pages/cart_order_sheet.dart';

Future<dynamic> cartOrderBottomSheet(
  BuildContext buildContext,
  RestaurantOrderModel order,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<MyOrdersCubit>(context),
      child: CartOrderSheet(
        order: order,
      ),
    ),
    isScrollControlled: true,
  );
}
