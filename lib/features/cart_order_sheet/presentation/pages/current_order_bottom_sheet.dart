import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/widgets/checkout_button.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/widgets/order_food_container.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_total_price.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/dashed_line.dart';

class CurrentOrderBottomSheet extends StatelessWidget {
  final RestaurantOrderModel order;
  const CurrentOrderBottomSheet({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 500.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Текущий заказ',
                style: h20,
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: AppColor.grey,
            thickness: 1,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => OrderSheetFoodContainer(
                      restaurant: order,
                      order: order.foods[index],
                    ),
                    itemCount: order.foods.length,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const DashedLine(
                width: 4,
                color: AppColor.black,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Обслуживание',
                    style: st14,
                  ),
                  Text(
                    '70 C',
                    style: st14,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Итого',
                    style: h16,
                  ),
                  Text(
                    '${(getOrderTotalPrice(
                          order.foods,
                        ) + 70).toStringAsFixed(0)} C',
                    style: h16,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              OrderCheckoutButton(
                order: order,
                title: 'Подтвердить заказ',
                hasMargin: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
