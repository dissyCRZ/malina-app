import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class SheetFilterButton extends StatelessWidget {
  const SheetFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: borderR10,
      ),
      margin: marginHV10,
      padding: marginH,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/filter.png',
            height: 12,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Фильтр',
            style: h16,
          ),
        ],
      ),
    );
  }
}
