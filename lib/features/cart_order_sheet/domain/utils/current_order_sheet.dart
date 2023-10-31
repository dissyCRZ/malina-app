import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/pages/current_order_bottom_sheet.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/my_orders_cubit.dart';

Future<dynamic> currentOrderBottomSheet(
  BuildContext buildContext,
  RestaurantOrderModel order,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<MyOrdersCubit>(buildContext),
        ),
        BlocProvider.value(
          value: BlocProvider.of<AddressContCubit>(buildContext),
        ),
      ],
      child: CurrentOrderBottomSheet(
        order: order,
      ),
    ),
    isScrollControlled: true,
  );
}
