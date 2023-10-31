import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/restaurant_page/data/enums/restaurant_action.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/pages/place_info.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/cubit/restaurant_controller.dart';
import '../cubit/restaurant_action_cubit.dart';
import 'restaurant_foods_sliver.dart';

class RestaurantBottomActionSliver extends StatelessWidget {
  const RestaurantBottomActionSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantActionCubit, RestaurantActionEnum>(
      builder: (context, state) {
        if (state == RestaurantActionEnum.menu) {
          return const RestaurantFoodsSliver();
        } else if (state == RestaurantActionEnum.info) {
          return PlaceInfo(
            place: context.read<RestaurantContCubit>().state,
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
