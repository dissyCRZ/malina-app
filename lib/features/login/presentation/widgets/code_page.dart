import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/phone_number_cubit.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../shared/configs/texts.dart';

class LoginCodePage extends StatelessWidget {
  const LoginCodePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final phoneNumber = context.read<PhoneNumberCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
        Column(
          children: [
            Container(
              width: 280.w,
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: const Text(
                'Подтвердите ваш номер',
                style: h24,
              ),
            ),
            Column(
              children: [
                const Text(
                  'Мы отправили смс с кодом на номер',
                  style: st14,
                ),
                Text(
                  phoneNumber,
                  style: st14,
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Введите код',
              style: st14,
            ),
            const SizedBox(
              height: 10,
            ),
            PinCodeTextField(
              appContext: context,
              length: 6,
              autoFocus: true,
              autoUnfocus: true,
              textStyle: st36,
              animationType: AnimationType.scale,
              enableActiveFill: true,
              cursorColor: AppColor.black,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: borderR10,
                fieldHeight: 70,
                fieldWidth: 50,
                activeColor: AppColor.lightGrey,
                disabledColor: AppColor.lightGrey,
                inactiveColor: AppColor.lightGrey,
                selectedColor: AppColor.lightGrey,
                inactiveFillColor: AppColor.lightGrey,
                selectedFillColor: AppColor.lightGrey,
                activeFillColor: AppColor.lightGrey,
              ),
              onChanged: (value) {},
              onCompleted: (value) async {
                final token = await context.read<LoginCubit>().login(
                      context.read<PhoneNumberCubit>().state,
                      value,
                    );
                if (token != null && context.mounted) {
                  context.pop();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Отправить еще раз',
              style: it12,
            ),
          ],
        ),
      ],
    );
  }
}
