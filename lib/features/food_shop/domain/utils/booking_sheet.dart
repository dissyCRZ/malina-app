import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/booking_sheet.dart';
import '../../data/models/place.dart';

Future<dynamic> bookingBottomSheet(
  BuildContext buildContext,
  final BusinessModel restaurant,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<BookingCubit>(
        buildContext,
      ),
      child: BookingSheet(
        restaurant: restaurant,
      ),
    ),
    isScrollControlled: true,
  );
}
