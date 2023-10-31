import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import '../enum/booking_type.dart';

class BookingModel {
  final int id;
  final BusinessModel business;
  final DateTime dateTime;
  final int guests;
  final String name;
  final String phone;
  final BookingTypeEnum status;
  final String? comment;
  BookingModel({
    required this.id,
    required this.business,
    required this.dateTime,
    required this.guests,
    required this.name,
    required this.phone,
    required this.status,
    this.comment,
  });
}
