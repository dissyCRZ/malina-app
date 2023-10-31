import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/notification/data/datasources/notifications_list.dart';
import 'package:malina_mobile_app/features/notification/data/models/notification.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState([]));
  load() {
    List<NotificationModel> notifications = [...notificationsList];
    notifications.sort(
      (a, b) => b.time.compareTo(
        a.time,
      ),
    );
    emit(
      NotificationState(
        [
          ...notifications,
        ],
      ),
    );
  }
}
