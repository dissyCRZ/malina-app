import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';
import 'package:malina_mobile_app/features/restaurant_foods/domain/utils/get_extra_name.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/ingredients_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class FoodExtraContainer extends StatelessWidget {
  final FoodExtraEnum extra;
  const FoodExtraContainer({
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
          BlocBuilder<IngredientsCubit, IngredientsState>(
            builder: (context, state) {
              final isSelected = state.extras.contains(extra);
              return GestureDetector(
                onTap: () {
                  if (isSelected) {
                    context.read<IngredientsCubit>().removeExtra(
                          extra,
                        );
                  } else {
                    context.read<IngredientsCubit>().addExtra(
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
          Text(
            getExtraName(extra),
            style: st16,
          ),
        ],
      ),
    );
  }
}
