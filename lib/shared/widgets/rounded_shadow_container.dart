import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/other.dart';

class RoundedShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final BoxShadow? shadow;
  const RoundedShadowContainer({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.white,
        boxShadow: [
          shadow ?? bigShadow,
        ],
      ),
      child: child,
    );
  }
}
