import 'package:flutter/material.dart';
import '../configs/texts.dart';
import '../constants/colors.dart';

class GreyFilledButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final Function? function;
  final EdgeInsets? margin;
  const GreyFilledButton({
    Key? key,
    required this.title,
    this.color,
    this.width,
    this.height,
    this.function,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: width ?? double.infinity,
      margin: margin ??
          const EdgeInsets.symmetric(
            vertical: 10,
          ),
      child: FilledButton(
        onPressed: () {
          if (function != null) {
            function!();
          }
        },
        style: FilledButton.styleFrom(
          backgroundColor: AppColor.softGrey,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: h16,
          foregroundColor: color ?? AppColor.green,
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
