import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/filter_sheet/presentation/cubit/filter_sheet_cubit.dart';
import 'package:malina_mobile_app/features/notification/data/models/notification.dart';
import 'package:malina_mobile_app/features/notification/domain/utils/filter_notifications.dart';
import 'package:malina_mobile_app/features/notification/presentation/widgets/notification_container.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationModel> allNotifications;
  const NotificationsList({
    Key? key,
    required this.allNotifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FilterSheetCubit, int>(
        builder: (context, state) {
          final notifications = filterNotifications(
            state,
            allNotifications,
          );
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) => NotificationContainer(
              notification: notifications[index],
            ),
          );
        },
      ),
    );
  }
}
