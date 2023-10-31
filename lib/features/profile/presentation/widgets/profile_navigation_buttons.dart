import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/page_controller_cubit.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/my_orders_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class ProfileNavigationButtons extends StatelessWidget {
  const ProfileNavigationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProfileNavigationButtonItem(
          function: () {
            context.read<PageContCubit>().change(1);
          },
          icon: 'heart',
          title: 'Избранное',
        ),
        ProfileNavigationButtonItem(
          function: () {
            myOrdersBottomSheet(context);
          },
          icon: 'cart',
          title: ' Мои заказы',
        ),
        const ProfileNavigationButtonItem(
          icon: 'wallet',
          title: 'Кошелек',
        ),
      ],
    );
  }
}

class ProfileNavigationButtonItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function? function;
  const ProfileNavigationButtonItem({
    Key? key,
    required this.icon,
    required this.title,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColor.lightGrey,
            child: Image.asset(
              'assets/icons/profile/$icon.png',
              color: AppColor.malina,
              width: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: st14,
          ),
        ],
      ),
    );
  }
}
