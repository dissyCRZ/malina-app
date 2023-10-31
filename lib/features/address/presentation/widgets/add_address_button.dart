import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import '../cubit/address_page_controller.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasAddress = context.read<AddressCubit>().state.addresses.isNotEmpty;
    return GestureDetector(
      onTap: () {
        context.read<AddressPageContCubit>().change(1);
      },
      child: Container(
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
            Text(
              hasAddress ? 'Добавить другой адрес' : 'Добавить адрес',
              style: st14,
            ),
          ],
        ),
      ),
    );
  }
}
