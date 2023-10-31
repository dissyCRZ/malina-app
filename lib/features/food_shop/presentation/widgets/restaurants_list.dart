import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/food_product_category_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_restaurant_category.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/pages/restaurant.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'restaurant_container.dart';

class RestaurantsList extends StatelessWidget {
  final List<BusinessModel> allRestaurants;
  const RestaurantsList({
    Key? key,
    required this.allRestaurants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodsCubit = context.read<FoodsCubit>();
    final foodCategoryCubit = context.read<FoodCategoryCubit>();
    return Expanded(
      child: BlocBuilder<SelectedRestaurantCategory, BusinessCategoryModel>(
        builder: (context, state) {
          List<BusinessModel> restaurants = [];
          if (state.name == allOfThemString) {
            restaurants = allRestaurants;
          } else {
            restaurants = allRestaurants
                .where(
                  (e) => e.category == state.id,
                )
                .toList();
          }
          return ListView.builder(
            itemBuilder: (context, index) => OpenContainer(
              transitionType: ContainerTransitionType.fade,
              transitionDuration: const Duration(milliseconds: 400),
              openBuilder: (context, _) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: foodsCubit,
                  ),
                  BlocProvider.value(
                    value: foodCategoryCubit,
                  ),
                ],
                child: RestaurantPage(
                  restaurant: restaurants[index],
                ),
              ),
              closedBuilder: (context, _) => RestaurantContainer(
                restaurant: restaurants[index],
              ),
            ),
            itemCount: restaurants.length,
          );
        },
      ),
    );
  }
}
