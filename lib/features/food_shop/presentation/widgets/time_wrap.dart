import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/datasources/times_list.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_date_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class TimeWrap extends StatelessWidget {
  const TimeWrap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedDateCubit, DateTime>(
      builder: (context, state) {
        return Wrap(
          spacing: 6,
          runSpacing: 10,
          children: List.generate(
            timesList.length,
            (index) => GestureDetector(
              onTap: () {
                context.read<SelectedDateCubit>().changeHour(
                      timesList[index],
                    );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: state.hour == timesList[index]
                      ? AppColor.green
                      : AppColor.lightGrey,
                  borderRadius: borderR8,
                ),
                child: Text(
                  '${timesList[index]}:00',
                  style: state.hour == timesList[index]
                      ? st14.copyWith(
                          color: AppColor.white,
                        )
                      : st14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
