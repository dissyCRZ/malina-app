import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/home/presentation/cubit/app_type_cubit.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_button_controller.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/page_controller_cubit.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class BottombarMainButton extends StatelessWidget {
  final int state;
  const BottombarMainButton({
    Key? key,
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
          context.read<AppTypeCubit>().empty();
          context.read<PageContCubit>().change(2);
        },
        child: Center(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColor.red,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: AppColor.red.withOpacity(0.15),
                  spreadRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: AnimatedCrossFade(
                duration: const Duration(
                  milliseconds: 200,
                ),
                crossFadeState: state == 2
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: Padding(
                  padding: const EdgeInsets.only(
                    right: 3,
                  ),
                  child: Image.asset(
                    'assets/icons/navbar/main-unselected.png',
                    height: 25,
                    color: AppColor.white,
                  ),
                ),
                secondChild: Image.asset(
                  'assets/icons/navbar/main-selected.png',
                  height: 25,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
