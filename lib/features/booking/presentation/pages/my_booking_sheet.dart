import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:malina_mobile_app/features/booking/presentation/widgets/my_booking_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';

class MyBookingSheet extends StatefulWidget {
  const MyBookingSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBookingSheet> createState() => _MyBookingSheetState();
}

class _MyBookingSheetState extends State<MyBookingSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      hasPadding: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Бронирования',
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
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<BookingCubit, BookingState>(
              builder: (context, state) {
                return ListView.builder(
                  itemBuilder: (context, index) => MyBookingContainer(
                    booking: state.bookings[index],
                  ),
                  itemCount: state.bookings.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
