import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/food_product_category_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/food_tags_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_tags.dart';
import 'package:malina_mobile_app/features/restaurant_page/data/enums/restaurant_action.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import '../../../food_shop/data/models/place.dart';
import '../cubit/restaurant_action_cubit.dart';
import '../cubit/restaurant_controller.dart';
import '../widgets/restaurant_bottom_action_sliver.dart';
import '../widgets/restaurant_stats_sliver.dart';
import '../widgets/restaurant_top_sliver.dart';

class RestaurantPage extends StatelessWidget {
  final BusinessModel restaurant;
  const RestaurantPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RestaurantActionCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantContCubit(restaurant),
        ),
        BlocProvider(
          create: (context) => FoodTagsCubit(
            context.read<FoodCategoryCubit>().state,
          ),
        ),
      ],
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColor.white,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            const RestaurantTopSliver(),
            const RestaurantStatsSliver(),
            Builder(builder: (context) {
              return BlocBuilder<RestaurantActionCubit, RestaurantActionEnum>(
                builder: (context, state) {
                  if (state == RestaurantActionEnum.menu) {
                    return const SliverAppBar(
                      pinned: true,
                      toolbarHeight: 34,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.zero,
                        title: FoodTags(),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter();
                },
              );
            }),
            const RestaurantBottomActionSliver(),
          ],
        ),
      ),
    );
  }
}
