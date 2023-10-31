import 'package:malina_mobile_app/features/booking/data/enum/booking_type.dart';
import 'package:malina_mobile_app/features/booking/data/models/booking.dart';
import 'package:malina_mobile_app/features/food_shop/data/datasources/restaurants_list.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';

final bookingList = List.generate(
  random.nextInt(5) + 1,
  (index) => BookingModel(
    id: DateTime.now().millisecondsSinceEpoch,
    business: restaurantsList[random.nextInt(
      restaurantsList.length,
    )],
    dateTime: DateTime.now().subtract(
      Duration(
        days: random.nextInt(
          10,
        ),
      ),
    ),
    guests: random.nextInt(
      10,
    ),
    status: BookingTypeEnum.values.elementAt(
      random.nextInt(
        BookingTypeEnum.values.length,
      ),
    ),
    name: firstNames[random.nextInt(
      firstNames.length,
    )],
    phone: phoneNumbers[random.nextInt(
      phoneNumbers.length,
    )],
  ),
);
