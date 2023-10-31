part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final List<BookingModel> bookings;
  const BookingState(
    this.bookings,
  );

  @override
  List<Object> get props => [bookings];
}
