import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class RoundedIconButton extends StatelessWidget {
  final String icon;
  final Function? function;
  const RoundedIconButton({
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
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColor.softGrey,
        ),
        child: Image.asset(
          'assets/icons/$icon.png',
        ),
      ),
    );
  }
}
