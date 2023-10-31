import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/main/data/datasources/main_scaffold_data.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_button_controller.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/page_controller_cubit.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class BottombarButtonItem extends StatelessWidget {
  final int index;
  final int state;
  const BottombarButtonItem({
    Key? key,
    required this.index,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (context.read<CartButtonContCubit>().state) {
            context.read<CartButtonContCubit>().change();
          }
          context.read<PageContCubit>().change(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 18,
              height: 20,
              child: Image.asset(
                'assets/icons/navbar/${MainScaffoldData.foodIcons[index]}.png',
                color: state == index ? AppColor.red : AppColor.iconGrey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              MainScaffoldData.foodTitles[index],
              style: TextStyle(
                fontSize: 10,
                color: state == index ? AppColor.red : AppColor.iconGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
