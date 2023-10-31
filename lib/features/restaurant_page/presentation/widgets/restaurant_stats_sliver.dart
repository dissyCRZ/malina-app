import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import '../cubit/restaurant_controller.dart';
import '../widgets/restaurant_stats.dart';
import 'restaurant_action_list.dart';

class RestaurantStatsSliver extends StatelessWidget {
  const RestaurantStatsSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<RestaurantContCubit>().state;
    return SliverToBoxAdapter(
      child: Padding(
        padding: marginH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.addressName,
              style: st14,
            ),
            const SizedBox(
              height: 15,
            ),
            PlaceStats(
              place: restaurant,
            ),
            const RestaurantActionList(),
          ],
        ),
      ),
    );
  }
}
