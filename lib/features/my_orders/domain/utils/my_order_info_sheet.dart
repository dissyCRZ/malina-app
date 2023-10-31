import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/abstract_order.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/my_orders_cubit.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/pages/my_order_info_sheet.dart';

Future<dynamic> myOrderInfoBottomSheet(
  BuildContext buildContext,
  AbstractOrderModel order,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<MyOrdersCubit>(buildContext),
      child: MyOrderInfoSheet(
        order: order,
      ),
    ),
    isScrollControlled: true,
  );
}
