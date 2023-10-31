import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/domain/utils/address_sheet.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import 'add_address_button.dart';

class OrderAddAddress extends StatelessWidget {
  const OrderAddAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressContCubit, AddressContState>(
      builder: (context, state) {
        if (state is AddressSelected) {
          return RoundedShadowContainer(
            margin: marginH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.address.name,
                      style: h14,
                    ),
                    Text(
                      state.address.city,
                      style: st14,
                    ),
                    Text(
                      state.address.street,
                      style: it12,
                    ),
                    Text(
                      state.address.phoneNumber,
                      style: it12,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    addressBottomSheet(
                      context,
                      context.read<AddressContCubit>(),
                    );
                  },
                  child: Image.asset(
                    'assets/icons/edit.png',
                    height: 15,
                  ),
                ),
              ],
            ),
          );
        }
        return const OrderAddAddressButton();
      },
    );
  }
}
