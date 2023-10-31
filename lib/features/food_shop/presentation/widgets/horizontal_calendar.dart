import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:malina_mobile_app/features/food_shop/domain/utils/compare_days.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_date_cubit.dart';
import 'row_calendar_button.dart';
import 'horizontal_day_item.dart';

class HorizontalDayView extends StatelessWidget {
  const HorizontalDayView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedDateCubit, DateTime>(
      builder: (context, state) {
        final firstDayOfWeek = state.subtract(
          Duration(days: state.weekday - 1),
        );
        initializeDateFormatting('ru');
        final monthName =
            DateFormat('MMMM', 'ru').format(state).substring(0, 3);
        return Row(
          children: [
            RowCalendarButton(
              monthName: monthName,
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final currentDate = firstDayOfWeek.add(
                      Duration(days: index),
                    );
                    initializeDateFormatting('ru');
                    final dayName =
                        DateFormat('EEEE', 'ru').format(currentDate);

                    final bool isSelected =
                        compareDays(currentDate, state);
                    return HorizontalDayItem(
                      currentDate: currentDate,
                      isSelected: isSelected,
                      dayName: dayName,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 6,
                  ),
                  itemCount: 7,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
