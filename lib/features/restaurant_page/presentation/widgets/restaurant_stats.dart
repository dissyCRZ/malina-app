import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/favourites/presentation/widgets/affordability.dart';
import 'package:malina_mobile_app/features/favourites/presentation/widgets/restaurant_stats_item.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';

class PlaceStats extends StatelessWidget {
  const PlaceStats({
    super.key,
    required this.place,
  });

  final BusinessModel place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RestaurantStatsItem(
          icon: 'star',
          value: place.rating.toString(),
        ),
        const SizedBox(
          width: 10,
        ),
        RestaurantStatsItem(
          icon: 'send',
          value: '${place.distance} км',
        ),
        const SizedBox(
          width: 10,
        ),
        AffordabilityContainer(
          affordability: place.affordability,
        ),
        const SizedBox(
          width: 10,
        ),
        RestaurantStatsItem(
          icon: 'cachback',
          value: place.tip.toString(),
        ),
      ],
    );
  }
}
