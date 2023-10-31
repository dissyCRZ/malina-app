import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/calendar_visibility.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/day_picker_calendart.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/horizontal_calendar.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/time_wrap.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class AddRecordSheetTimeSelection extends StatelessWidget {
  const AddRecordSheetTimeSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: marginHV10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Дата',
                style: h18,
              ),
              SizedBox(
                height: 12,
              ),
              HorizontalDayView(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Builder(
          builder: (context) {
            return BlocBuilder<CalendarVisibilityCubit, bool>(
              builder: (context, state) {
                if (state) {
                  return DayPickerCalendar();
                }
                return const SizedBox.shrink();
              },
            );
          },
        ),
        const Padding(
          padding: marginHV20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Время',
                style: h18,
              ),
              SizedBox(
                height: 12,
              ),
              TimeWrap(),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
