import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/pages/beauty_order_sheet.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/my_orders_cubit.dart';

Future<dynamic> beautyOrderBottomSheet(
  BuildContext buildContext,
  BeautyOrderModel order,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<MyOrdersCubit>(context),
      child: BeautyOrderSheet(
        order: order,
      ),
    ),
    isScrollControlled: true,
  );
}
