import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';

class AdditiveButtonContainer extends StatelessWidget {
  final String title;
  final String icon;
  final Function? function;
  const AdditiveButtonContainer({
    Key? key,
    required this.title,
    required this.icon,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (function != null) {
            function!();
          }
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: borderR10,
            boxShadow: [
              smallShadow,
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
                width: 16,
                child: Image.asset(
                  'assets/icons/$icon.png',
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: st14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
