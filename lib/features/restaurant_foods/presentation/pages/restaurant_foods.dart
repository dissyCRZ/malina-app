import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/food_product_category_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/food_tags_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_tags.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/foods_list.dart';

class RestaurantFoods extends StatelessWidget {
  const RestaurantFoods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodTagsCubit(
        context.read<FoodCategoryCubit>().state,
      ),
      child: const Expanded(
        child: Column(
          children: [
            FoodTags(),
            FoodsList(),
          ],
        ),
      ),
    );
  }
}
