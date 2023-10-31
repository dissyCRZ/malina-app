import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_button_controller.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/page_controller_cubit.dart';
import 'package:malina_mobile_app/features/main/presentation/widgets/cart_button.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'button_item.dart';
import 'cart_type_button.dart';
import 'main_button.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartButtonContCubit, bool>(
      builder: (context, state) {
        return SizedBox(
          height: state ? 200 : 70,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  boxShadow: [
                    bottombarShadow,
                  ],
                ),
                child: BlocBuilder<PageContCubit, int>(
                  builder: (context, state) {
                    return Row(
                      children: List.generate(
                        5,
                        (index) {
                          if (index == 2) {
                            return BottombarMainButton(
                              state: state,
                            );
                          } else if (index == 4) {
                            return const BottombarCartButton();
                          }
                          return BottombarButtonItem(
                            index: index,
                            state: state,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const CartTypeButtons(),
            ],
          ),
        );
      },
    );
  }
}
