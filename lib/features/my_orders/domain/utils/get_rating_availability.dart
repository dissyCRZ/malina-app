import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';

bool getRatingAvailability(OrderStatusEnum status) {
  if (status == OrderStatusEnum.visited ||
      status == OrderStatusEnum.delivered) {
    return true;
  }
  return false;
}
