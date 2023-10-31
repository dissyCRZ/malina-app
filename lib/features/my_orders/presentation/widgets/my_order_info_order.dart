import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/abstract_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/order.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_order_info_foods_list.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_order_info_product_list.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class MyOrderInfoOrder extends StatelessWidget {
  final AbstractOrderModel order;
  const MyOrderInfoOrder({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Заказ',
          style: h18,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          order.place.name,
          style: h18.copyWith(
            color: AppColor.grey,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (order is MyBeautyOrderModel)
          MyOrderInfoProductList(
            order: order as MyBeautyOrderModel,
          ),
        if (order is MyOrderModel)
          MyOrderInfoFoodList(
            order: order as MyOrderModel,
          ),
      ],
    );
  }
}
