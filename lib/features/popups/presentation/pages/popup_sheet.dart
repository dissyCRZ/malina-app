import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/double_outlined.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';

class PopupSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final String firstButton;
  final String? secondButton;
  final Function firstFunction;
  final Function? secondFunction;
  const PopupSheet({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.firstButton,
    this.secondButton,
    required this.firstFunction,
    this.secondFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 600.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Text(
                title,
                style: h24,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                subtitle,
                style: st14,
              ),
              const SizedBox(
                height: 20,
              ),
              secondButton == null
                  ? MalinaFilledButton(
                      title: firstButton,
                      function: firstFunction,
                    )
                  : DoubleOutlined(
                      firstTitle: firstButton,
                      secondTitle: secondButton ?? '',
                      firstFunction: firstFunction,
                      secondFunction: secondFunction,
                      height: 60,
                      borderRadius: borderR10,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
