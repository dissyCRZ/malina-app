import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/booking/data/enum/booking_type.dart';
import 'package:malina_mobile_app/features/booking/data/models/booking.dart';
import 'package:malina_mobile_app/features/booking/domain/utils/get_booking_type_color.dart';
import 'package:malina_mobile_app/features/booking/domain/utils/get_booking_type_name.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';
import 'package:malina_mobile_app/shared/utils/get_last_numbers.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class MyBookingContainer extends StatelessWidget {
  final BookingModel booking;
  const MyBookingContainer({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      padding: marginHV20,
      margin: marginHV5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Бронирование № ${getLastNumber(booking.id.toString(), 6)}',
                style: h16,
              ),
              if (booking.status == BookingTypeEnum.completed)
                Image.asset(
                  'assets/icons/repeat.png',
                  width: 17.w,
                ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: AppColor.grey,
            height: 20,
          ),
          Text(
            booking.business.name,
            style: h18,
          ),
          Text(
            booking.business.addressName,
            style: it12,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: borderR6,
                  color: AppColor.lightGrey,
                ),
                padding: const EdgeInsets.all(7),
                child: Image.asset(
                  'assets/icons/calendar-outlined.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                booking.dateTime.localizedTimeOfDay(context),
                style: st14,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: borderR6,
                  color: AppColor.lightGrey,
                ),
                padding: const EdgeInsets.all(7),
                child: Image.asset(
                  'assets/icons/user.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${booking.guests} чел | ${booking.name} ${booking.phone}',
                style: st14,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 46,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.softGrey,
              borderRadius: borderR10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 3.5,
                  backgroundColor: getBookingTypeColor(
                    booking.status,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  getBookingTypeName(
                    booking.status,
                  ),
                  style: st14.copyWith(
                    color: getBookingTypeColor(
                      booking.status,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
