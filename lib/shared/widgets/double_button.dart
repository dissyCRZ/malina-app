import 'package:flutter/material.dart';
import '../configs/texts.dart';
import '../constants/colors.dart';

class DoubleButtons extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final double? height;
  final Color? firstColor;
  final Color? secondColor;
  final Function? firstFunction;
  final Function? secondFunction;
  final double? verticalMargin;
  final BorderRadius? borderRadius;
  const DoubleButtons({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
    this.height,
    this.firstColor,
    this.secondColor,
    this.firstFunction,
    this.secondFunction,
    this.verticalMargin,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin ?? 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: height,
              child: OutlinedButton(
                onPressed: () {
                  if (firstFunction != null) {
                    firstFunction!();
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColor.black,
                  backgroundColor: AppColor.lightGrey,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(40),
                  ),
                  side: const BorderSide(
                    color: AppColor.lightGrey,
                    width: 1,
                  ),
                ),
                child: Text(
                  firstTitle,
                  style: st14.copyWith(
                    color: firstColor ?? AppColor.darkGrey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: height,
              child: FilledButton(
                onPressed: () {
                  if (secondFunction != null) {
                    secondFunction!();
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: AppColor.malina,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  secondTitle,
                  style: st14.copyWith(
                    color: secondColor ?? AppColor.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
