import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';

String getOrderStatusName(OrderStatusEnum action) {
  switch (action) {
    case OrderStatusEnum.chipped:
      return 'В пути';
    case OrderStatusEnum.visited:
      return 'Посещено';
    case OrderStatusEnum.delivered:
      return 'Доставлено';
    case OrderStatusEnum.cancelled:
      return 'Отменено';
  }
}
