import 'package:flutter/material.dart';
import '../configs/texts.dart';
import '../constants/colors.dart';

class ColumnWithDivider extends StatelessWidget {
  final String title;
  final String data;
  const ColumnWithDivider({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: it14,
        ),
        Text(
          data,
          style: h14,
        ),
        const Divider(
          height: 10,
          thickness: 1,
          color: AppColor.grey,
        ),
      ],
    );
  }
}
