import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/domain/utils/current_order_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import '../cubit/popup_message_cubit.dart';
import '../widgets/additive_button_container.dart';
import '../widgets/checkout_button.dart';
import '../widgets/order_container.dart';

class CartOrderSheetOutside extends StatelessWidget {
  const CartOrderSheetOutside({
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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderSheetContainer(
                        order: order,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: marginHV10,
                    child: Row(
                      children: [
                        AdditiveButtonContainer(
                          title: 'Добавить к заказу',
                          icon: 'plus-outlined',
                          function: () {
                            currentOrderBottomSheet(
                              context,
                              order,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        AdditiveButtonContainer(
                          title: 'Вызвать официанта',
                          icon: 'waiter',
                          function: () {
                            context.read<PopupMessageCubit>().popup(
                                  'Ожидайте, официант сейчас подойдет',
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                  OrderCheckoutButton(
                    order: order,
                    title: 'Подтвердить заказ',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
