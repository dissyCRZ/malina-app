import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/order_type_controller.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/popup_message_cubit.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/widgets/beauty_checout_button.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/widgets/beauty_order_container.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import '../../../../shared/configs/texts.dart';
import '../widgets/add_address.dart';
import '../widgets/order_commentary.dart';
import '../widgets/order_type_switch.dart';
import '../widgets/popup_message_container.dart';

class BeautyOrderSheet extends StatelessWidget {
  final BeautyOrderModel order;
  const BeautyOrderSheet({
    Key? key,
    required this.order,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartOrderTypeContCubit(
            order.type,
          ),
        ),
        BlocProvider(
          create: (context) => AddressContCubit(),
        ),
        BlocProvider(
          create: (context) => PopupMessageCubit(),
        ),
      ],
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          BottomSheetContainer(
            height: 750.h,
            hasPadding: false,
            child: Column(
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
                            BeautyOrderSheetContainer(
                              order: order,
                            ),
                            Column(
                              children: [
                                OrderSheetTypeSwitch(
                                  totalPrice: order.products.fold(
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
                        child: BeautyOrderCheckoutButton(
                          title: 'Оформить заказ',
                          order: order,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            child: Builder(builder: (context) {
              return BlocBuilder<PopupMessageCubit, PopupMessageState>(
                builder: (context, state) {
                  if (state is PopupMessageVisible) {
                    return PopupMessageContainer(
                      title: state.message,
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
