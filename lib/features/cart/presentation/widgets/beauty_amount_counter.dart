import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class BeautyAmountCounter extends StatelessWidget {
  final int amount;
  const BeautyAmountCounter({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: borderR10,
            ),
            child: const Icon(
              Icons.remove,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          amount.toString(),
          style: h16,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: borderR10,
            ),
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
      ],
    );
  }
}
