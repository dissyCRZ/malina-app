import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/main/data/datasources/main_scaffold_data.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_button_controller.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class BottombarCartButton extends StatelessWidget {
  const BottombarCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          context.read<CartButtonContCubit>().change();
        },
        child: BlocBuilder<CartButtonContCubit, bool>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 18,
                  height: 20,
                  child: Image.asset(
                    'assets/icons/navbar/${MainScaffoldData.foodIcons[4]}.png',
                    color: state ? AppColor.red : AppColor.iconGrey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  MainScaffoldData.foodTitles[4],
                  style: TextStyle(
                    fontSize: 10,
                    color: state ? AppColor.red : AppColor.iconGrey,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
