import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:malina_mobile_app/features/booking/data/enum/booking_type.dart';
import 'package:malina_mobile_app/features/booking/data/models/booking.dart';
import 'package:malina_mobile_app/features/food_shop/data/repositories/food_repo.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';

class BookingRepo {
  Future<List<BookingModel>> bookingList() async {
    List<BookingModel> bookings = [];
    final response = await BaseHttpClient().get('products/bookings/');
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final booking in body) {
          try {
            final business =
                await FoodShopRepo().getBusiness(booking['business']['id']);
            bookings.add(
              BookingModel(
                id: booking['id'],
                business: business!,
                phone: booking['phone'],
                name: booking['name'],
                guests: booking['guests'],
                dateTime:
                    DateTime.parse(booking['date'] + ' ' + booking['time']),
                status: BookingTypeEnum.values.firstWhere(
                  (element) => element.name == booking['status'],
                ),
                comment: booking['comment'],
              ),
            );
          } catch (e) {
            log('bookingList - ${booking['id']}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in bookingList: $e');
      }
    }
    return bookings;
  }

  Future<BookingModel?> createBooking(BookingModel bookingModel) async {
    final response = await BaseHttpClient().post(
      'products/bookings/',
      {
        "business": bookingModel.business.id,
        "guests": bookingModel.guests,
        "date": DateFormat('yyyy-MM-dd').format(bookingModel.dateTime),
        "time": DateFormat('hh:mm:ss').format(bookingModel.dateTime),
        "name": bookingModel.name,
        "phone": bookingModel.phone,
        "comment": bookingModel.comment,
      },
    );
    if (response != null) {
      log(response.toString());
      try {
        final booking = jsonDecode(response);
        final business = await FoodShopRepo().getBusiness(booking['business']);
        return BookingModel(
          id: booking['id'],
          business: business!,
          phone: '',
          name: booking['user'] ?? '',
          guests: booking['guests'],
          dateTime: DateTime.parse(booking['date'] + ' ' + booking['time']),
          status: BookingTypeEnum.values.firstWhere(
            (element) => element.name == booking['status'],
          ),
          comment: booking['comment'],
        );
      } catch (e) {
        log('Someting wrong in bookingList: $e');
      }
    }
    return null;
  }
}
