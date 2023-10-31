import 'package:flutter/material.dart';
import '../../presentation/widgets/upcoming_sheet.dart';

Future<dynamic> upcomingBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => const UpcomingSoonSheet(),
    isScrollControlled: true,
  );
}
