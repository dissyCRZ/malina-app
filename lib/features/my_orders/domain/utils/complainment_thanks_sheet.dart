import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/pages/complainment_thanks_sheet.dart';

Future<dynamic> complainmentThanksBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => const ComplainmentThanksSheet(),
    isScrollControlled: true,
  );
}
