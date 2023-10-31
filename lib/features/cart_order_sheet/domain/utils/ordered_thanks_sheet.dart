import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/pages/ordered_thanks.dart';

Future<dynamic> orderedThanksBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => const OrderedThanksSheet(),
    isScrollControlled: true,
  );
}
