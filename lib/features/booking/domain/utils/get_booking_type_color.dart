import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/booking/data/enum/booking_type.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

Color getBookingTypeColor(BookingTypeEnum type) {
  switch (type) {
    case BookingTypeEnum.pending:
      return AppColor.orange;
    case BookingTypeEnum.confirmed:
      return AppColor.green;
    case BookingTypeEnum.completed:
      return AppColor.green;
    case BookingTypeEnum.cancelled:
      return AppColor.red;
    case BookingTypeEnum.rejected:
      return AppColor.red;
  }
}
