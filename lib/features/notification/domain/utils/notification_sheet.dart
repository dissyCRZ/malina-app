import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/notification/presentation/pages/notification_sheet.dart';

Future<dynamic> notificationBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => const NotificationSheet(),
    isScrollControlled: true,
  );
}
