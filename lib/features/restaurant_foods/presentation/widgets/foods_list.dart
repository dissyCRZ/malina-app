import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food_category.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/food_tags_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_container.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allFoods = context.read<FoodsCubit>().state.foods;
    return Expanded(
      child: BlocBuilder<FoodTagsCubit, FoodCategoryModel>(
        builder: (context, state) {
          final foods = allFoods
              .where(
                (element) => element.category == state.id,
              )
              .toList();
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
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
