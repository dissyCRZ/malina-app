import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/booking_sheet_controller.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/calendar_visibility.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/guest_count_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_date_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/booking_sheet_table_selection.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/cubit/restaurant_controller.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import '../../data/models/place.dart';
import 'booking_sheet_time_selection.dart';

class BookingSheet extends StatelessWidget {
  final BusinessModel restaurant;
  const BookingSheet({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedDateCubit(),
        ),
        BlocProvider(
          create: (context) => GuestCountCubit(),
        ),
        BlocProvider(
          create: (context) => CalendarVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => BookingSheetContCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantContCubit(restaurant),
        ),
      ],
      child: BottomSheetContainer(
        hasPadding: false,
        child: Builder(builder: (context) {
          return BlocBuilder<BookingSheetContCubit, bool>(
            builder: (context, state) {
              return AnimatedCrossFade(
                duration: const Duration(
                  milliseconds: 300,
                ),
                crossFadeState: state
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const BookingSheetTimeSelection(),
                secondChild: const BookingSheetTableSelection(),
              );
            },
          );
        }),
      ),
    );
  }
}
