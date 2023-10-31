import 'package:malina_mobile_app/features/beauty_shop/data/datasources/beauty_names.dart';
import 'package:malina_mobile_app/features/restaurant_page/data/enums/affordability.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/app_lat_long.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';
import '../../../food_shop/data/models/place.dart';

final List<BusinessModel> barbershopsList = List.generate(
  restaurants.length,
  (index) => BusinessModel(
    id: DateTime.now().millisecondsSinceEpoch,
    name: beautyBrandNames[random.nextInt(
      beautyBrandNames.length,
    )],
    category: random.nextInt(10),
    description: 'description',
    affordability: Affordability.values[random.nextInt(
      Affordability.values.length,
    )],
    addressName: dummyAddresses[random.nextInt(
      dummyAddresses.length,
    )],
    tip: (random.nextInt(6) + 4),
    distance: random.nextInt(10) + 10,
    waitTime: random.nextInt(10) * 5 + 10,
    rating: (random.nextInt(6) + 4) / 2,
    image: (random.nextInt(5) + 1).toString(),
    coordinates: AppLatLong(
      lat: 55.75 + random.nextDouble() * 10,
      long: 37.6 + random.nextDouble() * 10,
    ),
  ),
);
