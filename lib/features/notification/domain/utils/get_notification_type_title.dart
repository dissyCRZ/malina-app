import 'package:malina_mobile_app/features/notification/data/enums/notification_type.dart';

String getNotificationTypeTitle(NotificationTypeEnum type) {
  switch (type) {
    case NotificationTypeEnum.order:
      return 'Заказы';
    case NotificationTypeEnum.record:
      return 'Записи';
    case NotificationTypeEnum.wallet:
      return 'Кошелек';
    case NotificationTypeEnum.coupon:
      return 'Скидки/Купоны';
  }
}
