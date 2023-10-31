import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/expansion_controller.dart';
import 'package:malina_mobile_app/features/cart/presentation/widgets/order_with_price.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/domain/utils/cart_order_sheet.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_total_price.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import 'outside_order_food_container.dart';

class OutsideOrderContainer extends StatelessWidget {
  const OutsideOrderContainer({
    super.key,
    required this.order,
  });

  final RestaurantOrderModel order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderExpansionContCubit(),
      child: Builder(builder: (context) {
        return RoundedShadowContainer(
          margin: marginHV5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        order.restaurant.name,
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
                  Row(
                    children: [
                      SizedBox(
                        height: 15,
                        child: Image.asset(
                          'assets/icons/location.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'В заведении',
                        style: st16.copyWith(
                          color: AppColor.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: AppColor.grey,
              ),
              AnimatedSize(
                duration: const Duration(
                  milliseconds: 300,
                ),
                child: BlocBuilder<OrderExpansionContCubit, bool>(
                  builder: (context, state) {
                    final isExpanded = order.foods.length < 2 || state;
                    return Column(
                      children: [
                        ListView.builder(
                          itemBuilder: (context, index) =>
                              OutsideOrderFoodContainer(
                            restaurant: order,
                            order: order.foods[index],
                          ),
                          itemCount: isExpanded ? order.foods.length : 2,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                        ),
                        if (order.foods.length > 2)
                          GestureDetector(
                            onTap: () {
                              context.read<OrderExpansionContCubit>().change();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AnimatedCrossFade(
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                crossFadeState: isExpanded
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                firstChild: Image.asset(
                                  'assets/icons/double-up.png',
                                  width: 15,
                                  color: AppColor.grey,
                                ),
                                secondChild: Image.asset(
                                  'assets/icons/double-down.png',
                                  width: 15,
                                  color: AppColor.grey,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              Builder(builder: (context) {
                double totalPrice = getOrderTotalPrice(
                  order.foods,
                );
                return OrderWithPriceButton(
                  function: () {
                    cartOrderBottomSheet(context, order);
                  },
                  price: totalPrice,
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
