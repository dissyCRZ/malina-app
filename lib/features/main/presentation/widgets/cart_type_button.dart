import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/main/data/enums/cart_type.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_button_controller.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_type_cubit.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/page_controller_cubit.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';

class CartTypeButtons extends StatelessWidget {
  const CartTypeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartButtonContCubit, bool>(
      builder: (context, state) {
        return Positioned(
          bottom: 65,
          right: 7,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
              boxShadow: [
                cartShadow,
              ],
            ),
            child: AnimatedCrossFade(
              duration: const Duration(
                milliseconds: 300,
              ),
              crossFadeState:
                  state ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              secondChild: const SizedBox(
                width: 70,
                height: 0,
              ),
              firstChild: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context.read<CartTypeCubit>().change(CartTypeEnum.food);
                        context.read<PageContCubit>().change(4);
                        if (context.read<CartButtonContCubit>().state) {
                          context.read<CartButtonContCubit>().change();
                        }
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColor.grey,
                        child: SizedBox(
                          width: 21,
                          child: Image.asset(
                            'assets/icons/navbar/food.png',
                            color: AppColor.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context
                            .read<CartTypeCubit>()
                            .change(CartTypeEnum.beauty);
                        context.read<PageContCubit>().change(4);
                        context.read<CartButtonContCubit>().change();
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColor.grey,
                        child: SizedBox(
                          width: 21,
                          child: Image.asset(
                            'assets/icons/navbar/beauty.png',
                            color: AppColor.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
