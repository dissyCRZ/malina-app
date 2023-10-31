import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';
import '../../data/models/extra.dart';

List<ExtraModel> getExtrasByEnum(List<FoodExtraEnum> extraEnums) {
  List<ExtraModel> extras = [];
  if (extraEnums.contains(FoodExtraEnum.noExtra)) {
    return extras;
  }
  extras.addAll(
    extraEnums.map(
      (e) {
        switch (e) {
          case FoodExtraEnum.noExtra:
            return ExtraModel(
              name: '',
              price: 0,
            );
          case FoodExtraEnum.cheese:
            return ExtraModel(
              name: 'Сыр',
              price: 35,
            );
          case FoodExtraEnum.sause:
            return ExtraModel(
              name: 'Соус',
              price: 15,
            );
          case FoodExtraEnum.olive:
            return ExtraModel(
              name: 'Оливки',
              price: 20,
            );
          case FoodExtraEnum.sausage:
            return ExtraModel(
              name: 'Сосиски',
              price: 25,
            );
        }
      },
    ),
  );
  return extras;
}
