import 'package:malina_mobile_app/features/notification/data/enums/notification_type.dart';
import 'package:malina_mobile_app/features/notification/data/models/notification.dart';

List<NotificationModel> filterNotifications(
  int index,
  List<NotificationModel> notifications,
) {
  if (index > 0 && index < NotificationTypeEnum.values.length + 1) {
    return notifications
        .where(
          (element) =>
              element.type ==
              NotificationTypeEnum.values.elementAt(
                index - 1,
              ),
        )
        .toList();
  }

  return notifications;
}
