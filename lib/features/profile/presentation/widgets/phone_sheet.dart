import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/phone_field.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';

class PhoneNumberSheet extends StatelessWidget {
  PhoneNumberSheet({
    super.key,
  });
  final phoneCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Номер телефона',
              style: h20,
            ),
            GestureDetector(
              onTap: () {
                context.read<MyInfoSheetContCubit>().change(0);
              },
              child: const Icon(
                Icons.close,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            PhoneField(
              isEnabled: false,
              controller: phoneCont,
              phoneNumber: context.read<LoginCubit>().getPhoneNumber(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<MyInfoSheetContCubit>().change(6);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      'Изменить номер',
                      style: h16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
