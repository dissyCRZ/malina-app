import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/login/domain/utils/login_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/profile_navigation_buttons.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';

class ProfileNotSigned extends StatelessWidget {
  const ProfileNotSigned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: marginH,
          padding: marginHV20,
          decoration: BoxDecoration(
            borderRadius: borderR20,
            color: AppColor.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: borderR10,
                  color: AppColor.white,
                  boxShadow: [
                    smallShadow,
                  ],
                ),
                child: Image.asset(
                  'assets/icons/profile/app.png',
                  width: 18,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Войдите или зарегистрируйтесь',
                style: h24,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Чтобы делать покупки, отслеживать заказы  и пользоваться персональными баллами',
                style: st14,
              ),
              const SizedBox(
                height: 30,
              ),
              MalinaFilledButton(
                title: 'Войти или зарегистрироваться',
                height: 60,
                function: () {
                  loginBottomSheet(context);
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          margin: marginH,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: borderR20,
            color: AppColor.white,
          ),
          child: const ProfileNavigationButtons(),
        )
      ],
    );
  }
}
