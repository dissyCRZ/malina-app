import 'package:flutter/material.dart';
import '../../presentation/pages/my_order_rating_thanks.dart';

Future<dynamic> myOrderRatingThanksBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => const MyOrderRatingThanksSheet(),
    isScrollControlled: true,
  );
}
