import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/pages/complainment_sheet.dart';

Future<dynamic> complainmentBottomSheet(
  BuildContext buildContext,
  BusinessModel place,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => ComplainmentSheet(
      place: place,
    ),
    isScrollControlled: true,
  );
}
