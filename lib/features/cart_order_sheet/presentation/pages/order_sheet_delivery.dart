import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/widgets/add_address.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import '../widgets/order_commentary.dart';
import '../widgets/order_type_switch.dart';
import '../widgets/checkout_button.dart';
import '../widgets/order_container.dart';

class CartOrderSheetDelivery extends StatelessWidget {
  const CartOrderSheetDelivery({
    super.key,
    required this.order,
  });

  final RestaurantOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Оформление заказа',
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
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderSheetContainer(
                      order: order,
                    ),
                    Column(
                      children: [
                        OrderSheetTypeSwitch(
                          totalPrice: order.foods.fold(
                            0,
                            (sum, next) =>
                                sum + next.amount * next.product.price,
                          ),
                        ),
                        const OrderAddAddress(),
                        const SizedBox(
                          height: 20,
                        ),
                        const OrderCommentaryContainer(),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: OrderCheckoutButton(
                  title: 'Оформить заказ',
                  order: order,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
