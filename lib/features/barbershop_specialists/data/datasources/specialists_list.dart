import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_specialty.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';
import '../models/specialist.dart';

final List<SpecialistModel> specialistList = List.generate(
  random.nextInt(10) + 4,
  (index) => SpecialistModel(
    id: random.nextInt(100),
    businessId: random.nextInt(100),
    name: firstNames[random.nextInt(
      firstNames.length,
    )],
    imageUrl: '${random.nextInt(4) + 1}',
    averageRating: 4.8,
    portfolio: List.generate(
      random.nextInt(7) + 1,
      (index) => '${random.nextInt(4) + 1}',
    ),
    category: BeautySpecialtyModel(
      id: 1000,
      name: 'NoCat',
    ),
  ),
);
