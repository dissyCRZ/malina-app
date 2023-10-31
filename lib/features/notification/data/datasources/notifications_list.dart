import 'package:malina_mobile_app/features/notification/data/enums/notification_type.dart';
import 'package:malina_mobile_app/features/notification/data/models/notification.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';

List<NotificationModel> notificationsList = List.generate(
  5,
  (index) => NotificationModel(
    title: 'Заказ уже в ${firstNames[random.nextInt(
      firstNames.length,
    )]}',
    description: 'Курьер выехал на доставку вашего заказа № ${random.nextInt(
      100000,
    )}',
    time: DateTime.now().subtract(
      Duration(
        days: random.nextInt(
          20,
        ),
      ),
    ),
    type: NotificationTypeEnum.values.elementAt(
      random.nextInt(
        NotificationTypeEnum.values.length,
      ),
    ),
  ),
);
