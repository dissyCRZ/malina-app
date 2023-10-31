import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/extras_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/widgets/add_extras_bottom_sheet.dart';

Future<dynamic> orderAddExtrasModalSheet(
    BuildContext buildContext, RestaurantOrderModel restaurant, FoodOrderModel food,) {
  return showModalBottomSheet(
    context: buildContext,
    isScrollControlled: true,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<OrderExtrasCubit>(buildContext),
        ),
        BlocProvider.value(
          value: BlocProvider.of<CartCubit>(buildContext),
        ),
   
      ],
      child: OrderExtrasBottomSheet(
        restaurant: restaurant,food: food,
      ),
    ),
  );
}
