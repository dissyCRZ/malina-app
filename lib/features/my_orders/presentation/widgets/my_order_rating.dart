import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_rating_message.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/rating_controllerd.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'rating_message_container.dart';

class MyOrderRatingContainer extends StatelessWidget {
  const MyOrderRatingContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginHV20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ваша оценка',
            style: h18,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.softGrey,
              borderRadius: borderR12,
            ),
            child: BlocBuilder<MyOrderRatingContCubit, int>(
              builder: (context, state) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    RatingStars(
                      maxValue: 5,
                      starSize: 40,
                      onValueChanged: (value) {
                        context.read<MyOrderRatingContCubit>().change(
                              value.toInt(),
                            );
                      },
                      starSpacing: 8,
                      starColor: AppColor.yellow,
                      starOffColor: AppColor.grey,
                      value: state.toDouble(),
                      valueLabelVisibility: false,
                      starBuilder: (index, color) => Image.asset(
                        'assets/icons/star.png',
                        color: color,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      top: -50,
                      left: state * 46 - 77,
                      child: RatingMessageContainer(
                        title: getRatingMessage(state),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
