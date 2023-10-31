
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food_category.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/food_tags_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_container.dart';
import '../cubit/restaurant_controller.dart';

class RestaurantFoodsSliver extends StatelessWidget {
  const RestaurantFoodsSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<RestaurantContCubit>().state;
    final allFoods =
        context.read<FoodsCubit>().getFoodBySupplier(restaurant.id);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      sliver: BlocBuilder<FoodTagsCubit, FoodCategoryModel>(
        builder: (context, state) {
          final foods = allFoods
              .where(
                (element) => element.category == state.id,
              )
              .toList();
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) => FoodContainer(
              food: foods[index],
            ),
            itemCount: foods.length,
          );
        },
      ),
    );
  }
}
