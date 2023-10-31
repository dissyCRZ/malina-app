import '../constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedBorderContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  const RoundedBorderContainer({
    Key? key,
    required this.child,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: margin ?? const EdgeInsets.only(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.white,
        border: Border.all(
          color: AppColor.grey,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
