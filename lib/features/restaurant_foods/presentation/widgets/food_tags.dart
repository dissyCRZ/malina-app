import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food_category.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/food_product_category_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/food_tags_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class FoodTags extends StatelessWidget {
  const FoodTags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: marginHV10,
      decoration: const BoxDecoration(
        color: AppColor.white,
      ),
      child: BlocBuilder<FoodTagsCubit, FoodCategoryModel>(
        builder: (context, state) {
          final allTags = context.read<FoodCategoryCubit>().state;
          return ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isSelected = state == allTags[index];
              return GestureDetector(
                onTap: () {
                  context.read<FoodTagsCubit>().change(
                        allTags[index],
                      );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: isSelected
                        ? Border.all(
                            color: AppColor.malina,
                          )
                        : Border.all(
                            color: AppColor.grey,
                            width: 1,
                          ),
                    color: isSelected ? AppColor.malina : AppColor.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    allTags[index].name,
                    style: isSelected
                        ? st16.copyWith(
                            color: AppColor.white,
                          )
                        : st16,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemCount: allTags.length,
          );
        },
      ),
    );
  }
}
