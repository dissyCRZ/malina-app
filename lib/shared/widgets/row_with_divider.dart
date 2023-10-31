import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/widgets/dashed_line.dart';
import '../configs/texts.dart';
import '../constants/colors.dart';

class RowWithDivider extends StatelessWidget {
  final String title;
  final String data;
  final bool? isDashed;

  const RowWithDivider({
    Key? key,
    required this.title,
    required this.data,
    this.isDashed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: it14,
            ),
            Text(
              data,
              style: h14,
            ),
          ],
        ),
        isDashed ?? false
            ? const DashedLine(
                width: 4,
              )
            : const Divider(
                height: 10,
                thickness: 1,
                color: AppColor.grey,
              ),
      ],
    );
  }
}
