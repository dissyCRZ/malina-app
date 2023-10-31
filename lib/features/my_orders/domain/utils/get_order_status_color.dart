import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

Color getOrderStatusColor(OrderStatusEnum status) {
  switch (status) {
    case OrderStatusEnum.chipped:
      return AppColor.blue;
    case OrderStatusEnum.visited:
      return AppColor.green;
    case OrderStatusEnum.delivered:
      return AppColor.green;
    case OrderStatusEnum.cancelled:
      return AppColor.red;
  }
}
