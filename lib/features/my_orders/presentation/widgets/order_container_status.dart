import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_order_status_color.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_order_status_name.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class MyOrderContainerStatus extends StatelessWidget {
  const MyOrderContainerStatus({
    Key? key,
    required this.status,
    required this.type,
  }) : super(key: key);

  final OrderStatusEnum status;
  final DeliveryTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: borderR10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 4,
            backgroundColor: getOrderStatusColor(
              status,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            getOrderStatusName(
              status,
            ),
            style: st14.copyWith(
              color: getOrderStatusColor(
                status,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          type == DeliveryTypeEnum.outside
              ? Image.asset(
                  'assets/icons/location.png',
                  height: 14,
                  color: getOrderStatusColor(
                    status,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
