import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/order_type_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class OrderSheetTypeSwitch extends StatelessWidget {
  final double totalPrice;
  const OrderSheetTypeSwitch({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginHV20,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Доставка',
                style: h18,
              ),
              Text(
                '$totalPrice C',
                style: h16,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CartOrderTypeContCubit, DeliveryTypeEnum>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: borderR10,
                  color: AppColor.lightGrey,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<CartOrderTypeContCubit>().change(
                                DeliveryTypeEnum.delivery,
                              );
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: state == DeliveryTypeEnum.delivery
                                ? AppColor.white
                                : AppColor.lightGrey,
                            borderRadius: borderR10,
                          ),
                          child: Text(
                            'Доставка',
                            style: state == DeliveryTypeEnum.delivery
                                ? h14
                                : h14.copyWith(
                                    color: AppColor.grey,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<CartOrderTypeContCubit>().change(
                                DeliveryTypeEnum.outside,
                              );
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: state == DeliveryTypeEnum.outside
                                ? AppColor.white
                                : AppColor.lightGrey,
                            borderRadius: borderR10,
                          ),
                          child: Text(
                            'Самовывоз',
                            style: state == DeliveryTypeEnum.outside
                                ? h14
                                : h14.copyWith(
                                    color: AppColor.grey,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
