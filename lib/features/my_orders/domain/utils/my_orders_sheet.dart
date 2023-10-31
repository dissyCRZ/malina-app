import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/my_orders_cubit.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/pages/my_orders_sheet.dart';

Future<dynamic> myOrdersBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<MyOrdersCubit>(buildContext),
      child: const MyOrdersSheet(),
    ),
    isScrollControlled: true,
  );
}
