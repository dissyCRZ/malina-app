import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class BarbershopActionButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String icon;
  const BarbershopActionButton({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(7),
              child: Image.asset(
                'assets/icons/barbershop/$icon.png',
                color: isSelected ? AppColor.malina : AppColor.black,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: isSelected ? h14.copyWith(color: AppColor.malina) : h14,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
