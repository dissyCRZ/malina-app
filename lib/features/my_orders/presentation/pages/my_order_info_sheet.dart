import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_rating_availability.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_total_price.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/my_order_rating.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_order_info_general.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_order_info_order.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/dashed_line.dart';
import 'package:malina_mobile_app/shared/widgets/grey_filled_button.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../../data/models/abstract_order.dart';

class MyOrderInfoSheet extends StatelessWidget {
  final AbstractOrderModel order;
  const MyOrderInfoSheet({
    Key? key,
    required this.order,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Подробнее о заказе',
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      MyOrderInfoGeneral(
                        order: order,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Адрес получателя',
                            style: h18,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            order.address.city +
                                order.address.street +
                                order.address.house,
                            style: st14,
                          ),
                          Text(
                            order.address.phoneNumber,
                            style: st14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyOrderInfoOrder(
                        order: order,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const DashedLine(
                        color: AppColor.black,
                        width: 4,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Доставка',
                                style: it14,
                              ),
                              Text(
                                '160 C',
                                style: it14,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Итого',
                                style: h16,
                              ),
                              Text(
                                '${getOrderTotalPrice(
                                  order.products,
                                )} C',
                                style: h16,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
          Positioned(
            bottom: -10,
            child: getRatingAvailability(order.status)
                ? MalinaFilledButton(
                    width: 350.w,
                    height: 60,
                    title: 'Оценить заказ',
                    function: () {
                      context.pop();
                      myOrderRatingBottomSheet(
                        context,
                        order,
                      );
                    },
                  )
                : GreyFilledButton(
                    width: 350.w,
                    height: 60,
                    color: AppColor.grey,
                    title: 'Оценить заказ',
                  ),
          ),
        ],
      ),
    );
  }
}
