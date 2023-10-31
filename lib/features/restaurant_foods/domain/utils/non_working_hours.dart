import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/non_working_hours.dart';

Future<dynamic> nonWorkingHoursBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => const NonWorkingHoursSheet(),
    isScrollControlled: true,
  );
}
