import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/food_product_category_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/restaurant_category_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/restaurant_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_restaurant_category.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/widgets/restaurant_types.dart';
import '../widgets/food_search_container.dart';
import '../widgets/restaurants_list.dart';

class FoodShop extends StatelessWidget {
  const FoodShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FoodsCubit()..load(),
        ),
        BlocProvider(
          create: (context) => SelectedRestaurantCategory(
              context.read<RestaurantCategoryCubit>().state),
        ),
        BlocProvider(
          create: (context) => RestaurantCubit()..load(),
        ),
        BlocProvider(
          create: (context) => RestaurantCategoryCubit()..load(),
        ),
        BlocProvider(
          create: (context) => FoodCategoryCubit()..load(),
        ),
      ],
      child: Column(
        children: [
          const FoodSearchContainer(),
          BlocBuilder<RestaurantCategoryCubit, List<BusinessCategoryModel>>(
            builder: (context, state) {
              return RestaurantTypes(tags: state);
            },
          ),
          Builder(
            builder: (context) {
              return BlocBuilder<RestaurantCubit, RestaurantState>(
                builder: (context, state) {
                  return RestaurantsList(
                    allRestaurants: state.restaurants,
                  );
                },
              );
            }
          ),
        ],
      ),
    );
  }
}
