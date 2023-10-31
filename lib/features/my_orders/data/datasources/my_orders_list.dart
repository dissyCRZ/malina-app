import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/food_shop/data/datasources/restaurants_list.dart';
import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';
import '../../../yandex_map/data/models/app_lat_long.dart';
import '../models/order.dart';

final List<MyOrderModel> myOrdersList = List.generate(
  random.nextInt(5) + 4,
  (index) => MyOrderModel(
    id: DateTime.now().millisecondsSinceEpoch,
    products: [],
    place: restaurantsList[random.nextInt(
      restaurantsList.length,
    )],
    status: OrderStatusEnum.values.elementAt(
      random.nextInt(
        OrderStatusEnum.values.length,
      ),
    ),
    date: DateTime.now().subtract(
      Duration(
        days: random.nextInt(
          20,
        ),
      ),
    ),
    address: AddressModel(
      id: uuid.v1(),
      city: 'London',
      entrance: '3',
      floor: '4',
      house: '4a',
      location: AppLatLong(
        lat: 55.75 + random.nextDouble() * 10,
        long: 37.6 + random.nextDouble() * 10,
      ),
      name: firstNames[random.nextInt(
        firstNames.length,
      )],
      phoneNumber: phoneNumbers[random.nextInt(
        phoneNumbers.length,
      )],
      street: 'WallStreet',
    ),
    type: DeliveryTypeEnum.values.elementAt(
      random.nextInt(
        DeliveryTypeEnum.values.length,
      ),
    ),
  ),
);
