import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/extras_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';
import 'package:malina_mobile_app/features/restaurant_foods/domain/utils/get_extra_name.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class OrderFoodExtraContainer extends StatelessWidget {
  final FoodExtraEnum extra;
  const OrderFoodExtraContainer({
    Key? key,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          BlocBuilder<OrderExtrasCubit, OrderExtrasState>(
            builder: (context, state) {
              final isSelected = state.extras.contains(extra);
              return GestureDetector(
                onTap: () {
                  if (isSelected) {
                    context.read<OrderExtrasCubit>().removeExtra(
                          extra,
                        );
                  } else {
                    context.read<OrderExtrasCubit>().addExtra(
                          extra,
                        );
                  }
                },
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? AppColor.green : AppColor.grey,
                      width: 1,
                    ),
                    color: isSelected ? AppColor.green : AppColor.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: AppColor.white,
                          size: 20,
                        )
                      : const SizedBox.shrink(),
                ),
              );
            },
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getExtraName(extra),
                  style: st16,
                ),
                Text(
                  getExtraPrice(extra),
                  style: st16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
