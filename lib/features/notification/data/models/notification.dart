import 'package:malina_mobile_app/features/notification/data/enums/notification_type.dart';

class NotificationModel {
  final String title;
  final String description;
  final DateTime time;
  final NotificationTypeEnum type;
  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.type,
  });
}
