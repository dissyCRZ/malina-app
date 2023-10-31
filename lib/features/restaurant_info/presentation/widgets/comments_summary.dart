import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/widgets/comment_summary_list_item.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class CommentsSummary extends StatelessWidget {
  const CommentsSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      height: 125.h,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 90,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: borderR6,
              color: AppColor.lightGrey,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Рейтинг',
                  style: h14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColor.yellow,
                    ),
                    Text(
                      '4,5',
                      style: st18,
                    ),
                  ],
                ),
                Text(
                  '367 Отзыва',
                  style: st12,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommentSummaryListItem(
                rating: 5,
                allComments: 397,
                thisComments: 320,
              ),
              CommentSummaryListItem(
                rating: 4,
                allComments: 397,
                thisComments: 40,
              ),
              CommentSummaryListItem(
                rating: 3,
                allComments: 397,
                thisComments: 5,
              ),
              CommentSummaryListItem(
                rating: 2,
                allComments: 397,
                thisComments: 1,
              ),
              CommentSummaryListItem(
                rating: 1,
                allComments: 397,
                thisComments: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
