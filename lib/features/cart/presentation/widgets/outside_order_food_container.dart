import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/extras_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/widgets/cart_add_extra.dart';
import 'package:malina_mobile_app/features/cart/presentation/widgets/food_amount_counter.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class OutsideOrderFoodContainer extends StatelessWidget {
  const OutsideOrderFoodContainer({
    Key? key,
    required this.restaurant,
    required this.order,
  }) : super(key: key);
  final RestaurantOrderModel restaurant;
  final FoodOrderModel order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderExtrasCubit(),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: borderR10,
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: CachedWithDefaultImage(
                    imageUrl: order.product.image,
                    defautImage: 'assets/debug/foods/1.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.product.name,
                          style: h16,
                        ),
                        Text(
                          '${order.product.price} C',
                          style: h16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${order.product.shortDescription} (${order.product.sizeOptions[0]} гр)',
                      style: it12,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            return FoodAmountCounter(
                              restaurant: restaurant,
                              food: order,
                            );
                          },
                        ),
                        SizedBox(
                          width: 20,
                          child: Image.asset(
                            'assets/icons/trash-can.png',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          CartAddExtra(
            restaurant: restaurant,
            food: order,
          ),
        ],
      ),
    );
  }
}
