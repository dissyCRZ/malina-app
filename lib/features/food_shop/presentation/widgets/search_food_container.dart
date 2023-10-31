import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/shared/configs/routes.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class FoodSearchFoodContainer extends StatelessWidget {
  final FoodModel food;
  const FoodSearchFoodContainer({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          RoutesNames.searchFood,
          extra: context.read<FoodsCubit>(),
          pathParameters: {
            'foodId': food.id.toString(),
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Hero(
                    tag: 'search-food-${food.id}',
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CachedWithDefaultImage(
                        imageUrl: food.image,
                        defautImage: 'assets/debug/foods/1.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.name,
                        style: st16,
                      ),
                      Text(
                        '${food.price} C',
                        style: st16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: AppColor.grey,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
