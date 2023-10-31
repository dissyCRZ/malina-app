import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/cart/domain/utils/get_total_price.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/domain/utils/beauty_order_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import '../widgets/order_with_price.dart';
import 'beauty_order_products_list.dart';

class BeautyOrderContainer extends StatelessWidget {
  final BeautyOrderModel order;
  const BeautyOrderContainer({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: marginHV5,
      padding: marginHV20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                order.business.name,
                style: it16,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColor.grey,
                size: 15,
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: AppColor.grey,
          ),
          BeautyOrderProductsList(
            order: order,
          ),
          OrderWithPriceButton(
            function: () {
              beautyOrderBottomSheet(
                context,
                order,
              );
            },
            price: getBarbershopProductTotalPrice(
              order.products,
            ),
          ),
        ],
      ),
    );
  }
}
