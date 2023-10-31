
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_page_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/phone_number_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/phone_field.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../../../../shared/configs/texts.dart';

class LoginPhonePage extends StatelessWidget {
  LoginPhonePage({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 280.w,
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: const Text(
                'Для оформления заказа нужен ваш телефон',
                style: h24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Заполните поле',
                  style: st14,
                ),
                const SizedBox(
                  height: 10,
                ),
                PhoneField(
                  controller: controller,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MalinaFilledButton(
              title: 'Подтвердить',
              height: 60,
              function: () async {
                //Todo: After phone code activated
                final message = await context.read<LoginCubit>().sendCode(
                      controller.text,
                    );
                if (context.mounted && message != null) {
                  context.read<PhoneNumberCubit>().change(controller.text);
                  context.read<LoginPageCubit>().change(1);
                }
              },
            ),
            Container(
              width: 300.w,
              alignment: Alignment.center,
              child: const Text(
                'Продолжая, вы соглашаетесь Со сбором, обработкой персональных данных и Ползовательским соглашением',
                style: it12,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
