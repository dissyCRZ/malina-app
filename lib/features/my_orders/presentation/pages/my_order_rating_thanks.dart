import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class MyOrderRatingThanksSheet extends StatelessWidget {
  const MyOrderRatingThanksSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      hasPadding: false,
      child: Column(
        children: [
          Padding(
            padding: marginHV20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
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
          ),
          RoundedShadowContainer(
            width: double.infinity,
            margin: marginHV10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/emoji/thumbs-up.png',
                  height: 95.h,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Спасибо за оценку!',
                  style: h24,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200.w,
                  child: const Text(
                    'Это нам поможет оценить качество обслуживания',
                    style: st14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
