import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/booking/data/models/booking.dart';
import 'package:malina_mobile_app/features/booking/data/repositories/booking_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit()
      : super(
          const BookingState(
            [],
          ),
        );
  load() async {
    final bookings = await BookingRepo().bookingList();
    emit(
      BookingState(
        bookings,
      ),
    );
  }

  book(
    BookingModel booking,
  ) async {
    final newBooking = await BookingRepo().createBooking(booking);
    if (newBooking != null) {
      emit(
        BookingState(
          [
            ...super.state.bookings,
            newBooking,
          ],
        ),
      );
    }
  }

  empty() {
    emit(
      const BookingState(
        [],
      ),
    );
  }
}
