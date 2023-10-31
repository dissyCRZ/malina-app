import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/booking_sheet_controller.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/calendar_visibility.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/day_picker_calendart.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/horizontal_calendar.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/simple_counter.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import 'time_wrap.dart';

class BookingSheetTimeSelection extends StatelessWidget {
  const BookingSheetTimeSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 390.w,
          height: 750.h,
          child: Column(
            children: [
              Padding(
                padding: marginHV20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Бронировать',
                      style: h20,
                    ),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: marginHV10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Количество гоcтей',
                              style: h18,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            GuestCounter(),
                          ],
                        ),
                      ),
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
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 390.w,
            padding: marginHV10,
            child: MalinaFilledButton(
              title: 'Забронировать',
              height: 60,
              function: () {
                context.read<BookingSheetContCubit>().change();
              },
            ),
          ),
        ),
      ],
    );
  }
}
