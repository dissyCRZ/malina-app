import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final bool? hasPadding;
  final double? height;
  const BottomSheetContainer({
    Key? key,
    required this.child,
    this.hasPadding,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hasPadding ?? true
          ? const EdgeInsets.all(20)
          : const EdgeInsets.only(),
      constraints: BoxConstraints(maxHeight: height ?? 700.h),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
