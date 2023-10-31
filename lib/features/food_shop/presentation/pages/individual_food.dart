import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/food_controller.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/ingredients_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/extras_column.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_description.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_page_main_image.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/sold_together_list.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/favourite_button.dart';

class IndividualSearchFoodPage extends StatelessWidget {
  final int foodId;
  const IndividualSearchFoodPage({
    Key? key,
    required this.foodId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final food = context.read<FoodsCubit>().getFoodById(foodId);
    final isFavourite = context.read<FavouritesCubit>().isFavourite(food);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IngredientsCubit(),
        ),
        BlocProvider(
          create: (context) => FoodContCubit(food),
        ),
      ],
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 390.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: 'search-food-${food.id}',
                      child: ProductPageMainImage(
                        product: food,
                      ),
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 25,
                      color: Colors.black,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  leadingWidth: 30,
                  title: Text(
                    food.name,
                    style: h20,
                  ),
                  actions: [
                    FavouriteButton(
                      isFavourite: isFavourite,
                      function: () {},
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: 390.w,
                    padding: marginHV20,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(22),
                      ),
                      boxShadow: [
                        bigShadow,
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDescription(
                          product: food,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const ExtrasColumn(),
                        const SizedBox(
                          height: 30,
                        ),
                        if (food.relatedProducts != null &&
                            food.relatedProducts!.isNotEmpty)
                          SoldTogetherList(
                            product: food,
                          ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
