import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class PersonalAccountItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function? function;
  const PersonalAccountItem({
    Key? key,
    required this.title,
    required this.icon,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  borderRadius: borderR8,
                  color: AppColor.lightGrey,
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/icons/profile/$icon.png',
                  color: AppColor.malina,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: h16,
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: AppColor.darkGrey,
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: AppColor.grey,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
