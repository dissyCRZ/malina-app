import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class CommentSummaryListItem extends StatelessWidget {
  final int rating;
  final int allComments;
  final int thisComments;
  const CommentSummaryListItem({
    Key? key,
    required this.rating,
    required this.allComments,
    required this.thisComments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingStars(
          maxValue: 5,
          starSize: 14,
          value: rating.toDouble(),
          valueLabelVisibility: false,
          maxValueVisibility: true,
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 4,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: borderR10,
            color: AppColor.grey,
          ),
          child: Row(
            children: [
              Container(
                height: 4,
                width: 110 * thisComments / allComments,
                decoration: BoxDecoration(
                  borderRadius: borderR10,
                  color: AppColor.green,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          thisComments.toString(),
          style: st14,
        ),
      ],
    );
  }
}
