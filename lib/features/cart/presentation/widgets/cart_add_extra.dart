import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart/domain/utils/add_extras.dart';
import 'package:malina_mobile_app/features/cart/domain/utils/get_extras_by_enum.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/extras_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class CartAddExtra extends StatelessWidget {
  final RestaurantOrderModel restaurant;
  final FoodOrderModel food;
  const CartAddExtra({
    Key? key,
    required this.restaurant,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        orderAddExtrasModalSheet(
          context,
          restaurant,
          food,
        );
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<OrderExtrasCubit, OrderExtrasState>(
          builder: (context, state) {
            return state.extras.isEmpty
                ? Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          'assets/icons/plus-outlined.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Добавки',
                        style: st16,
                      ),
                    ],
                  )
                : Text(
                    getExtrasByEnum(
                      state.extras,
                    )
                        .map((e) => '${e.name} ${e.price.toStringAsFixed(0)} C')
                        .join(
                          ', ',
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
          },
        ),
      ),
    );
  }
}
