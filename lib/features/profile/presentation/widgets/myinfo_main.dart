import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/myinfo_row_item_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';

class MyInfoMain extends StatelessWidget {
  const MyInfoMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Мои данные',
              style: h20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoggedIn) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyInfoRowItemContainer(
                    title: 'Имя',
                    value: state.user.userName ?? 'Anna Popova',
                    index: 1,
                  ),
                  MyInfoRowItemContainer(
                    title: 'Телефон',
                    value: state.user.phoneNumber,
                    index: 2,
                  ),
                  MyInfoRowItemContainer(
                    title: 'Дата рождения',
                    value: state.user.birthday?.dayMonthYear(context) ??
                        '01.01.2000',
                    index: 3,
                  ),
                  MyInfoRowItemContainer(
                    title: 'Email',
                    value: state.user.email ?? 'annapopova00@gmail.com',
                    index: 4,
                  ),
                  MyInfoRowItemContainer(
                    title: 'Безопасность',
                    value: state.user.password ?? 'Пароль',
                    index: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<LoginCubit>().logOut();
                    },
                    child: const Text(
                      'Выход',
                      style: h18,
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: Text(
                'Bы не авторизованы',
                style: h20,
              ),
            );
          },
        )
      ],
    );
  }
}
