import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/restaurant_foods/domain/utils/add_ingredients.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import '../cubit/food_controller.dart';

class AddIngredientContainer extends StatelessWidget {
  const AddIngredientContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addIngredientsModalSheet(
          context,
          context.read<FoodContCubit>().state.name,
        );
      },
      child: Container(
        height: 60.w,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            smallShadow,
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Row(
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
        ),
      ),
    );
  }
}
