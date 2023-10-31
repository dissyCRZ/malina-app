import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/pages/restaurant_comment_sheet.dart';

Future<dynamic> restaurantCommentsBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    isScrollControlled: true,
    builder: (context) => const RestaurantCommentsSheet(),
  );
}
