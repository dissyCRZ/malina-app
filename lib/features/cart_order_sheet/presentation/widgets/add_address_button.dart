import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/domain/utils/address_sheet.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';

class OrderAddAddressButton extends StatelessWidget {
  const OrderAddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addressBottomSheet(
          context,
          context.read<AddressContCubit>(),
        );
      },
      child: Padding(
        padding: marginHV20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Адрес доставки',
              style: h18,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  smallShadow,
                ],
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/icons/plus-outlined.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Добавить адрес',
                    style: st14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
