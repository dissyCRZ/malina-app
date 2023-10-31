import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:malina_mobile_app/features/restaurant_info/data/models/comment.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class CommentContainer extends StatelessWidget {
  final CommentModel comment;
  final double? height;
  final EdgeInsets? margin;
  const CommentContainer({
    Key? key,
    required this.comment,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: margin ??
          const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: h18,
          ),
          const SizedBox(
            height: 10,
          ),
          RatingStars(
            maxValue: 5,
            starSize: 12,
            value: comment.rating,
            valueLabelVisibility: false,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            comment.comment,
            style: it14,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                comment.date.dayMonthYear(context),
                style: it14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
