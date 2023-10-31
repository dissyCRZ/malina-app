import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class FoodAmountCounter extends StatelessWidget {
  final RestaurantOrderModel restaurant;
  final FoodOrderModel food;
  const FoodAmountCounter({
    Key? key,
    required this.restaurant,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().increaseDecrease(
                  restaurant,
                  food,
                  false,
                );
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.lightGrey,
            child: Icon(
              Icons.remove,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          food.amount.toString(),
          style: h16,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().increaseDecrease(
                  restaurant,
                  food,
                  true,
                );
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.lightGrey,
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ],
    );
  }
}
