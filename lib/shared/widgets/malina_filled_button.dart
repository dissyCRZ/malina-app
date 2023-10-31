import 'package:flutter/material.dart';
import '../configs/texts.dart';
import '../constants/colors.dart';

class MalinaFilledButton extends StatelessWidget {
  final String title;
  final double? width;
  final Function? function;
  final Color? color;
  final Color? textColor;
  final double? height;

  const MalinaFilledButton({
    Key? key,
    required this.title,
    this.width,
    this.function,
    this.color,
    this.textColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: width ?? double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: FilledButton(
        onPressed: () {
          if (function != null) {
            function!();
          }
        },
        style: FilledButton.styleFrom(
          backgroundColor: color ?? AppColor.malina,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: h16.copyWith(color: textColor),
          foregroundColor: textColor ?? AppColor.white,
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
