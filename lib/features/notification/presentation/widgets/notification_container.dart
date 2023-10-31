import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/notification/data/models/notification.dart';
import 'package:malina_mobile_app/features/notification/domain/utils/get_notification_type_icon.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class NotificationContainer extends StatelessWidget {
  final NotificationModel notification;
  const NotificationContainer({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: marginHV5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              'assets/icons/notifications/${getNotificationTypeIcon(
                notification.type,
              )}.png',
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: h16,
                ),
                Text(
                  notification.description,
                  style: st14,
                ),
                Text(
                  notification.time.dayMonthYear(context),
                  style: st12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
