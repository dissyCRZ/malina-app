import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';

class BarbershopAppBarItem extends StatelessWidget {
  final String icon;
  final Function? function;
  const BarbershopAppBarItem({
    Key? key,
    required this.icon,
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
      child: Container(
        width: 34,
        height: 34,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: AppColor.white,
          shape: BoxShape.circle,
          boxShadow: [
            smallShadow,
          ],
        ),
        child: Image.asset(
          'assets/icons/$icon.png',
          height: 15,
        ),
      ),
    );
  }
}
