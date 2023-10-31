import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/profile/domain/utils/my_info_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/personal_account.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/profile_data.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/profile_not_signed.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.malina,
        ),
        child: Column(
          children: [
            Padding(
              padding: appbarPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Профиль',
                    style: h20.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      myInfoModalSheet(context);
                    },
                    child: SizedBox(
                      height: 20,
                      child: Image.asset(
                        'assets/icons/profile/setting.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoggedIn) {
                      return ProfileData(
                        user: state.user,
                      );
                    }
                    return const ProfileNotSigned();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const PersonalAccount(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
