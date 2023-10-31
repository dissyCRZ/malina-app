import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:malina_mobile_app/features/booking/presentation/pages/my_booking_sheet.dart';

Future<dynamic> myBookingBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<BookingCubit>(buildContext),
      child: const MyBookingSheet(),
    ),
    isScrollControlled: true,
  );
}
