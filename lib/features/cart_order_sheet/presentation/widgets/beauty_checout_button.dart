import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class BeautyOrderCheckoutButton extends StatelessWidget {
  final BeautyOrderModel order;
  final String title;
  final bool? hasMargin;
  const BeautyOrderCheckoutButton({
    Key? key,
    required this.order,
    required this.title,
    this.hasMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double price = order.products.fold(
      0,
      (sum, next) => sum + next.amount * next.product.price,
    );
    return GestureDetector(
      onTap: () {
        final addressState = context.read<AddressContCubit>().state;
        if (addressState is AddressSelected) {
          context.pop(context);
        }
      },
      child: Container(
        width: 350.w,
        height: 60,
        decoration: BoxDecoration(
          color: AppColor.malina,
          borderRadius: borderR12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        margin: hasMargin ?? true ? marginHV20 : EdgeInsets.zero,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: h16white,
            ),
            Text(
              '$price C',
              style: h18white,
            ),
          ],
        ),
      ),
    );
  }
}
