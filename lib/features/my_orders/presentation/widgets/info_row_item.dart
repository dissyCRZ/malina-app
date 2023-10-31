import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class MyOrderInfoRowItem extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const MyOrderInfoRowItem({
    Key? key,
    required this.title,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: it14,
            ),
            Text(
              value,
              style: h14.copyWith(
                color: color,
              ),
            ),
          ],
        ),
        const Divider(
          height: 15,
          thickness: 1,
          color: AppColor.grey,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
