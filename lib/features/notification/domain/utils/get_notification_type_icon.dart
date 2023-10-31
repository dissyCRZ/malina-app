import 'package:malina_mobile_app/features/notification/data/enums/notification_type.dart';

String getNotificationTypeIcon(NotificationTypeEnum type) {
  switch (type) {
    case NotificationTypeEnum.order:
      return 'sent';
    case NotificationTypeEnum.record:
      return 'ball-added';
    case NotificationTypeEnum.coupon:
      return 'coupon';
    case NotificationTypeEnum.wallet:
      return 'wallet';
  }
}
