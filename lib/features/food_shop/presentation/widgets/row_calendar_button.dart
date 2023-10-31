import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/calendar_visibility.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class RowCalendarButton extends StatelessWidget {
  final String monthName;
  const RowCalendarButton({
    Key? key,
    required this.monthName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CalendarVisibilityCubit>().change();
      },
      child: BlocBuilder<CalendarVisibilityCubit, bool>(
        builder: (context, state) {
          return Container(
            height: 60,
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: state ? AppColor.green : AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: state ? AppColor.green : AppColor.grey,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  child: Image.asset(
                    'assets/icons/calendar.png',
                    color: state ? AppColor.white : AppColor.black,
                  ),
                ),
                Text(
                  monthName,
                  style: state
                      ? st12.copyWith(
                          color: AppColor.white,
                        )
                      : st12,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
