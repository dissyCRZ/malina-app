import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/order_type_controller.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/popup_message_cubit.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/pages/order_sheet_outside.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'order_sheet_delivery.dart';
import '../widgets/popup_message_container.dart';

class CartOrderSheet extends StatelessWidget {
  final RestaurantOrderModel order;
  const CartOrderSheet({
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
            child: Builder(builder: (context) {
              return BlocBuilder<CartOrderTypeContCubit, DeliveryTypeEnum>(
                builder: (context, state) {
                  switch (state) {
                    case DeliveryTypeEnum.delivery:
                      return CartOrderSheetDelivery(
                        order: order,
                      );
                    case DeliveryTypeEnum.outside:
                      return CartOrderSheetOutside(
                        order: order,
                      );
                  }
                },
              );
            }),
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
