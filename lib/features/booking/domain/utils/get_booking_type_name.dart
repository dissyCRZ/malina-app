import 'package:malina_mobile_app/features/booking/data/enum/booking_type.dart';

String getBookingTypeName(BookingTypeEnum type) {
  switch (type) {
    case BookingTypeEnum.pending:
      return 'Ожидает подтверждения';
    case BookingTypeEnum.confirmed:
      return 'Подтверждено';
    case BookingTypeEnum.completed:
      return 'Посещено';
    case BookingTypeEnum.cancelled:
      return 'Отменено';
    case BookingTypeEnum.rejected:
      return 'Отменено';
  }
}
