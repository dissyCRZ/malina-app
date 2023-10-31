import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/abstract_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/beauty_order_images_list.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/utils/get_last_numbers.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import '../../domain/utils/my_order_info_sheet.dart';
import 'order_container_status.dart';

class MyBeautyOrderContainer extends StatelessWidget {
  const MyBeautyOrderContainer({
    Key? key,
    required this.order,
    this.hasFunction,
  }) : super(key: key);

  final AbstractOrderModel order;
  final bool? hasFunction;

  @override
  Widget build(BuildContext context) {
    final idString = getLastNumber(
      order.id.toString(),
      6,
    );
    double totalPrice = 0;
    for (var element in order.products) {
      totalPrice += element.amount * element.product.price;
    }
    return RoundedShadowContainer(
      margin: marginHV5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (hasFunction ?? true) {
                myOrderInfoBottomSheet(
                  context,
                  order,
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Заказ № $idString',
                      style: h16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    hasFunction ?? true
                        ? const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const Text(
                  '10.01.2023',
                  style: it14,
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: AppColor.grey,
          ),
          Text(
            order.place.name,
            style: h18,
          ),
          Text(
            order.place.addressName,
            style: it12,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Сумма заказа: ${totalPrice.toStringAsFixed(0)} C',
            style: st14,
          ),
          const SizedBox(
            height: 10,
          ),
          MyBeautyOrderImagesList(
            order: order as MyBeautyOrderModel,
          ),
          const SizedBox(
            height: 10,
          ),
          MyOrderContainerStatus(
            status: order.status,
            type: order.type,
          ),
        ],
      ),
    );
  }
}
