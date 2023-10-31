import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/features/food_shop/domain/utils/get_food_by_query.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/search_controller.dart';
import 'search_food_container.dart';

class FoodSearchList extends StatelessWidget {
  final List<FoodModel> allFoods;
  const FoodSearchList({
    Key? key,
    required this.allFoods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchContCubit, String>(
        builder: (context, state) {
          final foods = getFoodsByQuery(state, allFoods);
          return ListView.builder(
            itemBuilder: (context, index) => FoodSearchFoodContainer(
              food: foods[index],
            ),
            itemCount: foods.length,
          );
        },
      ),
    );
  }
}
