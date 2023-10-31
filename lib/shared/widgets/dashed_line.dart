import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    Key? key,
    this.height,
    this.color,
    this.width,
  }) : super(key: key);

  final double? height;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width ?? 10.0;
        final dashHeight = height ?? 1;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color ?? AppColor.grey,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
