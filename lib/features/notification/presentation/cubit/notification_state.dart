part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final List<NotificationModel> notifications;
  const NotificationState(
    this.notifications,
  );

  @override
  List<Object> get props => [notifications];
}
